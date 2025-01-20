@interface AVPlayerItemIntegratedTimelineBoundaryObserver
- (AVPlayerItemIntegratedTimelineBoundaryObserver)initWithSegment:(id)a3 offsetTimes:(id)a4 queue:(id)a5 block:(id)a6;
- (BOOL)_ensureItemTimeOffsetLiesInSegment:(id)a3 item:(id)a4;
- (BOOL)_isItemCurrentTimeWithinZeroOffsetBoundaryThreshold:(id)a3 offset:(id *)a4;
- (BOOL)hasObserverBeenScheduledYet;
- (id)_currentInterstitialIDForSnapshot:(id)a3;
- (id)scheduledSegment;
- (void)dealloc;
- (void)ensureBoundaryObserverSegmentStillExistsWithNewSnapshot:(id)a3;
- (void)rescheduleObserverWithSnapshot:(id)a3 itemToSchedule:(id)a4;
@end

@implementation AVPlayerItemIntegratedTimelineBoundaryObserver

- (AVPlayerItemIntegratedTimelineBoundaryObserver)initWithSegment:(id)a3 offsetTimes:(id)a4 queue:(id)a5 block:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)AVPlayerItemIntegratedTimelineBoundaryObserver;
  v10 = [(AVPlayerItemIntegratedTimelineBoundaryObserver *)&v13 init];
  if (v10)
  {
    if (a5) {
      v11 = a5;
    }
    else {
      v11 = MEMORY[0x1E4F14428];
    }
    v10->_queue = (OS_dispatch_queue *)v11;
    dispatch_retain(v11);
    v10->_segment = (AVPlayerItemSegment *)[a3 copy];
    v10->_offsetTimes = (NSArray *)[a4 copy];
    v10->_block = (id)[a6 copy];
    v10->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v10;
}

- (void)dealloc
{
  [(AVTimebaseObserver *)self->_boundaryObserver invalidate];

  dispatch_release((dispatch_object_t)self->_queue);
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemIntegratedTimelineBoundaryObserver;
  [(AVPlayerItemIntegratedTimelineBoundaryObserver *)&v3 dealloc];
}

- (id)_currentInterstitialIDForSnapshot:(id)a3
{
  objc_super v3 = (void *)[a3 currentSegment];
  if ([v3 segmentType] != 1) {
    return 0;
  }
  v4 = (void *)[v3 interstitialEvent];
  return (id)[v4 identifier];
}

- (BOOL)_ensureItemTimeOffsetLiesInSegment:(id)a3 item:(id)a4
{
  v5 = (void *)[a4 _integratedTimelineOffsets];
  long long v6 = 0uLL;
  long long v13 = 0u;
  memset(&v14, 0, sizeof(v14));
  long long v11 = 0u;
  long long v12 = 0u;
  if (a3)
  {
    [a3 timeMapping];
    long long v6 = 0uLL;
  }
  *(_OWORD *)&v10.target.start.epoch = v6;
  *(_OWORD *)&v10.target.duration.timescale = v6;
  *(_OWORD *)&v10.source.duration.timescale = v6;
  *(_OWORD *)&v10.target.start.value = v6;
  *(_OWORD *)&v10.source.start.value = v6;
  *(_OWORD *)&v10.source.start.epoch = v6;
  CMTimeMappingMakeFromDictionary(&v10, (CFDictionaryRef)[v5 objectAtIndexedSubscript:0]);
  CMTimeRange range = v14;
  CMTimeRange target = v10.target;
  if (CMTimeRangeContainsTimeRange(&range, &target)) {
    return 1;
  }
  CMTimeRange range = v14;
  CMTimeRange target = v10.target;
  return CMTimeRangeEqual(&range, &target) != 0;
}

- (BOOL)_isItemCurrentTimeWithinZeroOffsetBoundaryThreshold:(id)a3 offset:(id *)a4
{
  if (a3) {
    [a3 currentTime];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  CMTimeSubtract(&time, &lhs, (CMTime *)&v6);
  return fabs(CMTimeGetSeconds(&time)) < 0.3;
}

- (void)rescheduleObserverWithSnapshot:(id)a3 itemToSchedule:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 32);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 64);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 80);
  *(_OWORD *)&v40.start.unsigned int value = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 48);
  *(_OWORD *)&v40.start.epoch = v8;
  *(_OWORD *)&v40.duration.timescale = v9;
  long long v10 = *MEMORY[0x1E4F1FA00];
  *(_OWORD *)&v39.start.epoch = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 16);
  *(_OWORD *)&v39.duration.timescale = v7;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&v38.start.unsigned int value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&v38.start.epoch = v11;
  *(_OWORD *)&v38.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  *(_OWORD *)&v39.start.unsigned int value = v10;
  uint64_t v12 = [a4 timebase];
  v28 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a4 && !self->_segmentWasRemoved)
  {
    MEMORY[0x199715030](self->_mutex);
    int64_t v13 = [(AVPlayerItemSegment *)self->_segment segmentType];
    if (v13)
    {
      CMTimeRange v14 = [(AVPlayerInterstitialEvent *)[(AVPlayerItemSegment *)self->_segment interstitialEvent] identifier];
      if (v14 == -[AVPlayerItemIntegratedTimelineBoundaryObserver _currentInterstitialIDForSnapshot:](self, "_currentInterstitialIDForSnapshot:", a3)&& -[AVPlayerItemIntegratedTimelineBoundaryObserver _ensureItemTimeOffsetLiesInSegment:item:](self, "_ensureItemTimeOffsetLiesInSegment:item:", [a3 currentSegment], a4))
      {
        CFDictionaryRef v15 = (const __CFDictionary *)[a4 _interstitialEventItemTimeOffset];
        if (v15) {
          CMTimeRangeMakeFromDictionary(&v38, v15);
        }
        goto LABEL_13;
      }
    }
    else if (!self->_boundaryObserver)
    {
      segment = self->_segment;
      if (segment) {
        [(AVPlayerItemSegment *)segment timeMapping];
      }
      else {
        memset(lhs, 0, sizeof(lhs));
      }
      CMTimeRange v39 = lhs[0];
      CMTimeRange v40 = lhs[1];
      CMTimeRange v38 = lhs[1];
LABEL_13:
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      offsetTimes = self->_offsetTimes;
      uint64_t v18 = [(NSArray *)offsetTimes countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(offsetTimes);
            }
            v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            memset(&v33, 0, sizeof(v33));
            if (v22) {
              [v22 CMTimeValue];
            }
            memset(&v32, 0, sizeof(v32));
            if (v13)
            {
              CMTime v32 = v33;
              memset(&v31, 0, sizeof(v31));
              lhs[0].start = v33;
              *(_OWORD *)&rhs.start.unsigned int value = *(_OWORD *)&v38.start.value;
              rhs.start.epoch = v38.start.epoch;
              CMTimeSubtract(&v31, &lhs[0].start, &rhs.start);
            }
            else
            {
              *(_OWORD *)&lhs[0].start.unsigned int value = *(_OWORD *)&v38.start.value;
              lhs[0].start.epoch = v38.start.epoch;
              rhs.start = v33;
              CMTimeAdd(&v32, &lhs[0].start, &rhs.start);
              memset(&v31, 0, sizeof(v31));
              CMTime v30 = v32;
              lhs[0] = v40;
              CMTimeRange rhs = v39;
              CMTimeMapTimeFromRangeToRange(&v31, &v30, lhs, &rhs);
            }
            lhs[0].start = v31;
            if (CMTimeGetSeconds(&lhs[0].start) <= 0.3
              && (lhs[0].start = v31,
                  [(AVPlayerItemIntegratedTimelineBoundaryObserver *)self _isItemCurrentTimeWithinZeroOffsetBoundaryThreshold:a4 offset:lhs]))
            {
              (*((void (**)(void))self->_block + 2))();
            }
            else
            {
              lhs[0] = v38;
              rhs.start = v32;
              if (CMTimeRangeContainsTime(lhs, &rhs.start))
              {
                lhs[0].start = v31;
                objc_msgSend(v28, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTime:", lhs));
              }
            }
          }
          uint64_t v19 = [(NSArray *)offsetTimes countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v19);
      }
      if ([v28 count])
      {
        if (dword_1E9356B30)
        {
          LODWORD(v33.value) = 0;
          LOBYTE(v32.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int value = v33.value;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v32.value)) {
            unsigned int v25 = value;
          }
          else {
            unsigned int v25 = value & 0xFFFFFFFE;
          }
          if (v25)
          {
            LODWORD(rhs.start.value) = 136315906;
            *(CMTimeValue *)((char *)&rhs.start.value + 4) = (CMTimeValue)"-[AVPlayerItemIntegratedTimelineBoundaryObserv"
                                                                          "er rescheduleObserverWithSnapshot:itemToSchedule:]";
            LOWORD(rhs.start.flags) = 2048;
            *(void *)((char *)&rhs.start.flags + 2) = self;
            HIWORD(rhs.start.epoch) = 2048;
            rhs.duration.unsigned int value = (CMTimeValue)a4;
            LOWORD(rhs.duration.timescale) = 2112;
            *(void *)((char *)&rhs.duration.timescale + 2) = v28;
            LODWORD(v27) = 42;
            p_CMTimeRange rhs = &rhs;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        [(AVTimebaseObserver *)self->_boundaryObserver invalidate];

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __96__AVPlayerItemIntegratedTimelineBoundaryObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke;
        v29[3] = &unk_1E57B1E80;
        v29[4] = self;
        self->_hasBeenScheduled = 1;
        self->_boundaryObserver = [[AVOccasionalTimebaseObserver alloc] initWithTimebase:v12 times:v28 queue:self->_queue block:v29];
      }
    }
    MEMORY[0x199715040](self->_mutex);
  }
}

uint64_t __96__AVPlayerItemIntegratedTimelineBoundaryObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (void)ensureBoundaryObserverSegmentStillExistsWithNewSnapshot:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a3 segments];
  MEMORY[0x199715030](self->_mutex);
  if ([(AVPlayerItemSegment *)self->_segment segmentType] == 1 && !self->_segmentWasRemoved)
  {
    v5 = [(AVPlayerInterstitialEvent *)[(AVPlayerItemSegment *)self->_segment interstitialEvent] identifier];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ([v10 segmentType] == 1
          && -[NSString isEqualToString:](v5, "isEqualToString:", objc_msgSend((id)objc_msgSend(v10, "interstitialEvent"), "identifier")))
        {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v7) {
            goto LABEL_6;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__AVPlayerItemIntegratedTimelineBoundaryObserver_ensureBoundaryObserverSegmentStillExistsWithNewSnapshot___block_invoke;
      block[3] = &unk_1E57B1E80;
      block[4] = self;
      dispatch_async(queue, block);
      self->_segmentWasRemoved = 1;
      [(AVTimebaseObserver *)self->_boundaryObserver invalidate];
    }
  }
  MEMORY[0x199715040](self->_mutex);
}

uint64_t __106__AVPlayerItemIntegratedTimelineBoundaryObserver_ensureBoundaryObserverSegmentStillExistsWithNewSnapshot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (BOOL)hasObserverBeenScheduledYet
{
  MEMORY[0x199715030](self->_mutex, a2);
  BOOL hasBeenScheduled = self->_hasBeenScheduled;
  MEMORY[0x199715040](self->_mutex);
  return hasBeenScheduled;
}

- (id)scheduledSegment
{
  MEMORY[0x199715030](self->_mutex, a2);
  segment = self->_segment;
  MEMORY[0x199715040](self->_mutex);
  return segment;
}

@end