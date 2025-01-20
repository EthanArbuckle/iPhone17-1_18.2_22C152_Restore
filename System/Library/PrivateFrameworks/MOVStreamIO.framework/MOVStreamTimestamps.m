@interface MOVStreamTimestamps
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTimeForAssetTrack:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtIndex:(SEL)a3;
- ($69C59A32909E13F94AB58097350E6BB9)restrictedTimeRange;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeFrom:(SEL)a3 to:(unint64_t)a4;
- (AVAssetTrack)assetTrack;
- (BOOL)shouldAppendEndOfStreamTimestamp;
- (BOOL)shouldStartTimestampsAtZero;
- (MOVStreamSampleTimeList)timeList;
- (MOVStreamTimestamps)init;
- (MOVStreamTimestamps)initWithAssetTrack:(id)a3;
- (MOVStreamTimestamps)initWithAssetTrack:(id)a3 restrictedTimeRange:(id *)a4;
- (NSArray)cmtimes;
- (NSArray)times;
- (NSString)name;
- (_NSRange)frameRangeFrom:(id *)a3 to:(id *)a4;
- (id)description;
- (id)sampleTimelineForAssetTrack:(id)a3;
- (id)sampleTimelineForAssetTrack:(id)a3 shouldStartTimestampsAtZero:(BOOL)a4;
- (unint64_t)count;
- (void)clearCachedProperties;
- (void)setAssetTrack:(id)a3;
- (void)setName:(id)a3;
- (void)setRestrictedTimeRange:(id *)a3;
- (void)setShouldAppendEndOfStreamTimestamp:(BOOL)a3;
- (void)setShouldStartTimestampsAtZero:(BOOL)a3;
- (void)setTimeList:(id)a3;
@end

@implementation MOVStreamTimestamps

- (MOVStreamTimestamps)initWithAssetTrack:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F010C8] + 16);
  v5[0] = *MEMORY[0x263F010C8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F010C8] + 32);
  return [(MOVStreamTimestamps *)self initWithAssetTrack:a3 restrictedTimeRange:v5];
}

- (MOVStreamTimestamps)initWithAssetTrack:(id)a3 restrictedTimeRange:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MOVStreamTimestamps;
  v8 = [(MOVStreamTimestamps *)&v20 init];
  v9 = v8;
  if (!v8)
  {
LABEL_8:
    v13 = v9;
    goto LABEL_12;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v8->_assetTrack, a3);
    *(_WORD *)&v9->_shouldStartTimestampsAtZero = 1;
    if ((a4->var0.var2 & 1) == 0 || (a4->var1.var2 & 1) == 0 || a4->var1.var3 || a4->var1.var0 < 0)
    {
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x263F010A8];
      CMTime v18 = *(CMTime *)*(void *)&MEMORY[0x263F010B0];
      CMTimeRangeMake(&v21, &start, &v18);
      long long v10 = *(_OWORD *)&v21.start.epoch;
      *(_OWORD *)&a4->var0.var0 = *(_OWORD *)&v21.start.value;
      *(_OWORD *)&a4->var0.var3 = v10;
      *(_OWORD *)&a4->var1.var1 = *(_OWORD *)&v21.duration.timescale;
    }
    long long v11 = *(_OWORD *)&a4->var0.var0;
    long long v12 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v9->_restrictedTimeRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v9->_restrictedTimeRange.start.epoch = v12;
    *(_OWORD *)&v9->_restrictedTimeRange.start.value = v11;
    goto LABEL_8;
  }
  v14 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    LODWORD(v21.start.value) = 138412290;
    *(CMTimeValue *)((char *)&v21.start.value + 4) = (CMTimeValue)v16;
    _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_ERROR, "❌ ERROR: Could not create %{pubic}@ with nil parameter", (uint8_t *)&v21, 0xCu);
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (MOVStreamTimestamps)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_ERROR, "❌ ERROR: Do not call -[%{public}@ init].", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)description
{
  v2 = [(MOVStreamTimestamps *)self timeList];
  long long v3 = [v2 description];

  return v3;
}

- (void)clearCachedProperties
{
}

- (void)setShouldStartTimestampsAtZero:(BOOL)a3
{
  if (self->_shouldStartTimestampsAtZero != a3)
  {
    self->_shouldStartTimestampsAtZero = a3;
    [(MOVStreamTimestamps *)self clearCachedProperties];
  }
}

- (void)setShouldAppendEndOfStreamTimestamp:(BOOL)a3
{
  if (self->_shouldAppendEndOfStreamTimestamp != a3)
  {
    self->_shouldAppendEndOfStreamTimestamp = a3;
    [(MOVStreamTimestamps *)self clearCachedProperties];
  }
}

- (MOVStreamSampleTimeList)timeList
{
  timeList = self->_timeList;
  if (!timeList)
  {
    if (self->_assetTrack)
    {
      -[MOVStreamTimestamps sampleTimelineForAssetTrack:](self, "sampleTimelineForAssetTrack:");
      v4 = (MOVStreamSampleTimeList *)objc_claimAutoreleasedReturnValue();
      v5 = self->_timeList;
      self->_timeList = v4;

      timeList = self->_timeList;
    }
    else
    {
      timeList = 0;
    }
  }

  return timeList;
}

- (_NSRange)frameRangeFrom:(id *)a3 to:(id *)a4
{
  v6 = [(MOVStreamTimestamps *)self timeList];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  uint64_t v7 = [v6 frameRangeFrom:&v13 to:&v12];
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeFrom:(SEL)a3 to:(unint64_t)a4
{
  NSUInteger v8 = [(MOVStreamTimestamps *)self timeList];
  if (v8)
  {
    NSUInteger v10 = v8;
    [v8 timeRangeFrom:a4 to:a5];
    NSUInteger v8 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (NSArray)times
{
  v2 = [(MOVStreamTimestamps *)self timeList];
  long long v3 = [v2 times];

  return (NSArray *)v3;
}

- (NSArray)cmtimes
{
  v2 = [(MOVStreamTimestamps *)self timeList];
  long long v3 = [v2 cmtimes];

  return (NSArray *)v3;
}

- (unint64_t)count
{
  v2 = [(MOVStreamTimestamps *)self timeList];
  unint64_t v3 = [v2 count];

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtIndex:(SEL)a3
{
  v6 = [(MOVStreamTimestamps *)self timeList];
  if (v6)
  {
    NSUInteger v8 = v6;
    [v6 timeAtIndex:a4];
    v6 = v8;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)sampleTimelineForAssetTrack:(id)a3
{
  id v4 = a3;
  v5 = [(MOVStreamTimestamps *)self sampleTimelineForAssetTrack:v4 shouldStartTimestampsAtZero:[(MOVStreamTimestamps *)self shouldStartTimestampsAtZero]];
  if ([(MOVStreamTimestamps *)self shouldAppendEndOfStreamTimestamp])
  {
    memset(&v10, 0, sizeof(v10));
    [(MOVStreamTimestamps *)self endTimeForAssetTrack:v4];
    if ((unsigned __int128)0 >> 96)
    {
      CMTime time1 = v10;
      CMTime v8 = *(CMTime *)*(void *)&MEMORY[0x263F010E8];
      if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0)
      {
        CMTime time1 = v10;
        [v5 appendTime:&time1];
      }
    }
  }
  v6 = [v5 timeline];

  return v6;
}

- (id)sampleTimelineForAssetTrack:(id)a3 shouldStartTimestampsAtZero:(BOOL)a4
{
  BOOL v32 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  if (v5)
  {
    uint64_t v7 = [v5 segments];
    v30 = v7;
    if ([v7 count])
    {
      v33 = self;
      CMTime v8 = -[MOVStreamSampleTimeRangeBuffer initWithCapacity:]([MOVStreamSampleTimeRangeBuffer alloc], "initWithCapacity:", objc_msgSend(v7, "count", v7));
      NSUInteger v9 = -[MOVStreamSampleTimeRangeBuffer initWithCapacity:]([MOVStreamSampleTimeRangeBuffer alloc], "initWithCapacity:", [v7 count]);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v57 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            if (([v15 isEmpty] & 1) == 0)
            {
              if (v15)
              {
                [v15 timeMapping];
                if (BYTE12(v53))
                {
                  [v15 timeMapping];
                  if (v49)
                  {
                    [v15 timeMapping];
                    if (!v48)
                    {
                      [v15 timeMapping];
                      if ((v47 & 0x8000000000000000) == 0)
                      {
                        [v15 timeMapping];
                        v46[0] = v45[3];
                        v46[1] = v45[4];
                        v46[2] = v45[5];
                        [(MOVStreamSampleTimeRangeBuffer *)v8 appendTimeRange:v46];
                        [v15 timeMapping];
                        v45[0] = v42;
                        v45[1] = v43;
                        v45[2] = v44;
                        [(MOVStreamSampleTimeRangeBuffer *)v9 appendTimeRange:v45];
                      }
                    }
                  }
                }
              }
              else
              {
                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v12);
      }

      v16 = [(MOVStreamSampleTimeRangeBuffer *)v8 timeRangeList];
      v17 = [(MOVStreamSampleTimeRangeBuffer *)v9 timeRangeList];

      self = v33;
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
    CMTime v18 = objc_msgSend(v5, "makeSampleCursorAtFirstSampleInDecodeOrder", v30);
    if (v18)
    {
      if (v16) {
        BOOL v19 = v17 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      int v20 = !v19;
      p_restrictedTimeRange = &self->_restrictedTimeRange;
      uint64_t v22 = (long long *)MEMORY[0x263F010E8];
      do
      {
        memset(&v41, 0, sizeof(v41));
        [v18 presentationTimeStamp];
        if (v20)
        {
          range.CMTime start = v41;
          uint64_t v23 = [v16 indexOfTimeRangeAtTime:&range];
          if ((v23 & 0x8000000000000000) == 0)
          {
            uint64_t v24 = v23;
            memset(&range, 0, sizeof(range));
            [v16 timeRangeAtIndex:v23];
            memset(&time, 0, sizeof(time));
            [v17 timeRangeAtIndex:v24];
            CMTime v37 = v41;
            CMTimeRange fromRange = range;
            CMTimeRange toRange = time;
            CMTimeMapTimeFromRangeToRange(&v38, &v37, &fromRange, &toRange);
            CMTime v41 = v38;
          }
        }
        if (v41.flags)
        {
          long long v25 = *(_OWORD *)&p_restrictedTimeRange->start.epoch;
          *(_OWORD *)&range.start.value = *(_OWORD *)&p_restrictedTimeRange->start.value;
          *(_OWORD *)&range.start.epoch = v25;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&p_restrictedTimeRange->duration.timescale;
          time.CMTime start = v41;
          if (CMTimeRangeContainsTime(&range, &time.start))
          {
            if ([v6 isEmpty])
            {
              range.CMTime start = v41;
              long long v34 = *v22;
              *(_OWORD *)&time.start.value = *v22;
              CMTimeEpoch v26 = *((void *)v22 + 2);
              time.start.epoch = v26;
              int32_t v27 = CMTimeCompare(&range.start, &time.start);
              BOOL v28 = v32;
              if (v32)
              {
                range.CMTime start = v41;
                *(_OWORD *)&time.start.value = v34;
                time.start.epoch = v26;
                BOOL v28 = CMTimeCompare(&range.start, &time.start) != 0;
              }
              if (v27 < 0 || v28)
              {
                *(_OWORD *)&range.start.value = v34;
                range.start.epoch = v26;
                [v6 appendTime:&range];
              }
            }
            range.CMTime start = v41;
            *(_OWORD *)&time.start.value = *v22;
            time.start.epoch = *((void *)v22 + 2);
            if ((CMTimeCompare(&range.start, &time.start) & 0x80000000) == 0)
            {
              range.CMTime start = v41;
              [v6 appendTime:&range];
            }
          }
        }
      }
      while ([v18 stepInPresentationOrderByCount:1]);
    }
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTimeForAssetTrack:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01098];
  if (a4)
  {
    [a4 timeRange];
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeRangeGetEnd(&v6, &range);
    *(CMTime *)retstr = v6;
  }
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)shouldStartTimestampsAtZero
{
  return self->_shouldStartTimestampsAtZero;
}

- (BOOL)shouldAppendEndOfStreamTimestamp
{
  return self->_shouldAppendEndOfStreamTimestamp;
}

- (void)setTimeList:(id)a3
{
}

- (AVAssetTrack)assetTrack
{
  return self->_assetTrack;
}

- (void)setAssetTrack:(id)a3
{
}

- ($69C59A32909E13F94AB58097350E6BB9)restrictedTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setRestrictedTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_restrictedTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_restrictedTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_restrictedTimeRange.start.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTrack, 0);
  objc_storeStrong((id *)&self->_timeList, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end