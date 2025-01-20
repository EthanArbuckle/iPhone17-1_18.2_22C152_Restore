@interface AVPlayerItemIntegratedTimelineSnapshot
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVPlayerItemIntegratedTimelineSnapshot)initWithSegments:(id)a3 duration:(id *)a4 currentTime:(id *)a5 currentDate:(id)a6 currentSegment:(id)a7;
- (AVPlayerItemSegment)currentSegment;
- (NSArray)segments;
- (NSDate)currentDate;
- (void)dealloc;
- (void)mapTime:(id *)a3 toSegment:(id *)a4 atSegmentOffset:(id *)a5;
@end

@implementation AVPlayerItemIntegratedTimelineSnapshot

- (AVPlayerItemIntegratedTimelineSnapshot)initWithSegments:(id)a3 duration:(id *)a4 currentTime:(id *)a5 currentDate:(id)a6 currentSegment:(id)a7
{
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItemIntegratedTimelineSnapshot;
  v12 = [(AVPlayerItemIntegratedTimelineSnapshot *)&v16 init];
  if (v12)
  {
    *((void *)v12 + 9) = [a3 copy];
    int64_t var3 = a4->var3;
    *(_OWORD *)(v12 + 8) = *(_OWORD *)&a4->var0;
    *((void *)v12 + 3) = var3;
    long long v14 = *(_OWORD *)&a5->var0;
    *((void *)v12 + 6) = a5->var3;
    *((_OWORD *)v12 + 2) = v14;
    *((void *)v12 + 7) = [a6 copy];
    *((void *)v12 + 8) = [a7 copy];
  }
  return (AVPlayerItemIntegratedTimelineSnapshot *)v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemIntegratedTimelineSnapshot;
  [(AVPlayerItemIntegratedTimelineSnapshot *)&v3 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (NSDate)currentDate
{
  v2 = (void *)[(NSDate *)self->_currentDate copy];
  return (NSDate *)v2;
}

- (AVPlayerItemSegment)currentSegment
{
  v2 = (void *)[(AVPlayerItemSegment *)self->_currentSegment copy];
  return (AVPlayerItemSegment *)v2;
}

- (NSArray)segments
{
  v2 = (void *)[(NSArray *)self->_segments copy];
  return (NSArray *)v2;
}

- (void)mapTime:(id *)a3 toSegment:(id *)a4 atSegmentOffset:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v8 = [(AVPlayerItemIntegratedTimelineSnapshot *)self segments];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
      if (v13)
      {
        [*(id *)(*((void *)&v24 + 1) + 8 * v12) timeMapping];
      }
      else
      {
        long long v21 = 0u;
        memset(&v22, 0, sizeof(v22));
        long long v19 = 0u;
        long long v20 = 0u;
      }
      CMTimeRange range = v22;
      CMTime time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v13 = 0;
  }
  if (a4) {
    *a4 = (id)[v13 copy];
  }
  if (a5)
  {
    if (v13)
    {
      [v13 timeMapping];
      CMTime rhs = *(CMTime *)&v16[3].timescale;
      v16[0] = (CMTime)*a3;
      CMTimeSubtract(&time, v16, &rhs);
      *(_OWORD *)&a5->var0 = *(_OWORD *)&time.value;
      CMTimeEpoch epoch = time.epoch;
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&a5->var0 = *MEMORY[0x1E4F1F9F8];
      CMTimeEpoch epoch = *(void *)(v15 + 16);
    }
    a5->int64_t var3 = epoch;
  }
}

@end