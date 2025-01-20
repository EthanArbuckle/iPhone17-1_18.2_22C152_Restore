@interface JFXAVMediaDataReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData;
- ($70930193D4F448A53BB9343C0237EB5F)JFX_allMediaTimeRange;
- ($70930193D4F448A53BB9343C0237EB5F)currentReadingRange;
- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange;
- (AVAsset)asset;
- (AVAssetReader)assetReader;
- (AVAssetReaderTrackOutput)assetReaderTrackOutput;
- (AVAssetTrack)assetTrack;
- (BOOL)JFX_resetReaderFromTime:(id *)a3;
- (BOOL)JFX_shouldResetReaderWhenSeekingFromStartTimeOfCurrentData:(id *)a3 toTime:(id *)a4;
- (BOOL)beginReading;
- (BOOL)beginReadingAtTime:(id *)a3;
- (BOOL)beginReadingAtTimeRange:(id *)a3;
- (BOOL)hasRemainingAvailableData;
- (BOOL)isScrubbing;
- (BOOL)prepareAssetReaderForReading;
- (BOOL)readAheadToTime:(id *)a3;
- (BOOL)seekToTime:(id *)a3;
- (BOOL)seekingAheadIsExpensiveFromTime:(id *)a3 toTime:(id *)a4;
- (JFXAVMediaDataReader)initWithAVAssetTrack:(id)a3 withName:(id)a4;
- (NSError)error;
- (NSString)name;
- (id)createAssetReader;
- (id)createAssetReaderTrackOutput;
- (int64_t)status;
- (unint64_t)signPostID;
- (void)JFX_configureAssetReaderToReadFromTime:(id *)a3;
- (void)JFX_configureAssetReaderTrackOutput;
- (void)JFX_releaseReadersForReset;
- (void)JFX_resetReaderIfNecessaryToSeekFromStartTimeOfCurrentData:(id *)a3 toTime:(id *)a4;
- (void)JFX_resetReadingRangeWhenScrubbingToTime:(id *)a3;
- (void)cancelReadingForReaderReset;
- (void)didFailWithError:(id)a3;
- (void)didUpdateReadingRange;
- (void)readAndDiscardRemainingAvailableData;
- (void)setAsset:(id)a3;
- (void)setAssetReader:(id)a3;
- (void)setAssetReaderTrackOutput:(id)a3;
- (void)setAssetTrack:(id)a3;
- (void)setCurrentReadingRange:(id *)a3;
- (void)setError:(id)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setReadableTimeRange:(id *)a3;
- (void)setSignPostID:(unint64_t)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation JFXAVMediaDataReader

- (JFXAVMediaDataReader)initWithAVAssetTrack:(id)a3 withName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)JFXAVMediaDataReader;
  v9 = [(JFXAVMediaDataReader *)&v18 init];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = MEMORY[0x263F010D0];
    long long v12 = *(_OWORD *)(MEMORY[0x263F010D0] + 16);
    *(_OWORD *)(v9 + 104) = *MEMORY[0x263F010D0];
    *(_OWORD *)(v9 + 120) = v12;
    *(_OWORD *)(v9 + 136) = *(_OWORD *)(v11 + 32);
    objc_storeStrong((id *)v9 + 5, a3);
    uint64_t v13 = [*((id *)v10 + 5) asset];
    v14 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = v13;

    *((void *)v10 + 9) = JFXSignpostIDFromObject(v10);
    objc_storeStrong((id *)v10 + 2, a4);
    v15 = v10 + 80;
    if (v7) {
      [v7 minFrameDuration];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    _OWORD *v15 = *(_OWORD *)&v17.value;
    *((void *)v10 + 12) = v17.epoch;
    if ((v10[92] & 1) == 0)
    {
      CMTimeMake(&v17, 1, +[JFXMediaSettings frameRate]);
      _OWORD *v15 = *(_OWORD *)&v17.value;
      *((void *)v10 + 12) = v17.epoch;
    }
  }

  return (JFXAVMediaDataReader *)v10;
}

- (BOOL)beginReading
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  [(JFXAVMediaDataReader *)self JFX_allMediaTimeRange];
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  return [(JFXAVMediaDataReader *)self beginReadingAtTimeRange:v4];
}

- (BOOL)beginReadingAtTimeRange:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ([(JFXAVMediaDataReader *)self status] == 1)
  {
    [(JFXAVMediaDataReader *)self readableTimeRange];
    long long v5 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range2.start.epoch = v5;
    *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a3->var1.var1;
    if (CMTimeRangeEqual(&range1, &range2)) {
      return 1;
    }
  }
  memset(&v28, 0, sizeof(v28));
  [(JFXAVMediaDataReader *)self JFX_allMediaTimeRange];
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var1.var0;
  time1.start.epoch = a3->var1.var3;
  *(_OWORD *)&time2.start.value = kMinimumReadingRangeDuration;
  time2.start.epoch = 0;
  CMTimeMaximum(&range2.start, &time1.start, &time2.start);
  *(_OWORD *)&a3->var1.var0 = *(_OWORD *)&range2.start.value;
  a3->var1.var3 = range2.start.epoch;
  memset(&v27, 0, sizeof(v27));
  [(JFXAVMediaDataReader *)self minimumFrameDuration];
  long long v7 = *(_OWORD *)&a3->var0.var0;
  CMTimeRange time2 = v28;
  *(_OWORD *)&v24.value = v7;
  v24.epoch = a3->var0.var3;
  memset(&start, 0, sizeof(start));
  CMTimeRange range2 = v28;
  CMTimeRangeGetEnd(&lhs, &range2);
  *(_OWORD *)&range2.start.value = v25;
  range2.start.epoch = v26;
  CMTimeSubtract(&start, &lhs, &range2.start);
  memset(&v32, 0, sizeof(v32));
  *(_OWORD *)&range2.start.value = *(_OWORD *)&time2.start.value;
  range2.start.epoch = time2.start.epoch;
  time1.CMTime start = start;
  CMTimeMaximum(&v32, &range2.start, &time1.start);
  range2.CMTime start = v32;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&time2.start.value;
  time1.start.epoch = time2.start.epoch;
  if (CMTimeCompare(&range2.start, &time1.start))
  {
    memset(&range2, 0, sizeof(range2));
    *(_OWORD *)&time1.start.value = *(_OWORD *)&time2.start.value;
    time1.start.epoch = time2.start.epoch;
    CMTime end = v32;
    CMTimeRangeFromTimeToTime(&range2, &time1.start, &end);
    CMTime end = v24;
    CMTimeRange time1 = range2;
    CMTimeClampToRange(&v27, &end, &time1);
  }
  else
  {
    CMTime v27 = v32;
  }
  memset(&time1, 0, 24);
  long long v8 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range2.start.epoch = v8;
  *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&time, &range2);
  CMTimeRange range2 = v28;
  CMTimeClampToRange(&time1.start, &time, &range2);
  time2.CMTime start = v27;
  CMTime start = time1.start;
  CMTimeRangeFromTimeToTime(&range2, &time2.start, &start);
  long long v9 = *(_OWORD *)&range2.start.epoch;
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)&range2.start.value;
  *(_OWORD *)&a3->var0.var3 = v9;
  *(_OWORD *)&a3->var1.var1 = *(_OWORD *)&range2.duration.timescale;
  long long v10 = *(_OWORD *)&a3->var0.var3;
  v21[0] = *(_OWORD *)&a3->var0.var0;
  v21[1] = v10;
  v21[2] = *(_OWORD *)&a3->var1.var1;
  [(JFXAVMediaDataReader *)self setReadableTimeRange:v21];
  uint64_t v11 = JFXLog_DebugMediaDataReader();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
    range2.start.epoch = a3->var0.var3;
    Float64 Seconds = CMTimeGetSeconds(&range2.start);
    long long v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range2.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range2.start.epoch = v16;
    *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v20, &range2);
    *(double *)&CMTimeValue v17 = CMTimeGetSeconds(&v20);
    LODWORD(range2.start.value) = 138412802;
    *(CMTimeValue *)((char *)&range2.start.value + 4) = (CMTimeValue)self;
    LOWORD(range2.start.flags) = 2048;
    *(Float64 *)((char *)&range2.start.flags + 2) = Seconds;
    HIWORD(range2.start.epoch) = 2048;
    range2.duration.value = v17;
    _os_log_debug_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEBUG, "%@ beginReadingAtTimeRange %f-%f", (uint8_t *)&range2, 0x20u);
  }

  long long v12 = JFXMediaDataReaderEventSignpostPointCategory();
  unint64_t v13 = [(JFXAVMediaDataReader *)self signPostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      LOWORD(range2.start.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v12, OS_SIGNPOST_EVENT, v14, "beginReadingAtTimeRange", (const char *)&unk_234D6C482, (uint8_t *)&range2, 2u);
    }
  }

  [(JFXAVMediaDataReader *)self readableTimeRange];
  *(_OWORD *)&range2.start.value = v18;
  range2.start.epoch = v19;
  if ([(JFXAVMediaDataReader *)self status] == 1)
  {
    *(_OWORD *)&time2.start.value = *(_OWORD *)&range2.start.value;
    time2.start.epoch = range2.start.epoch;
    return [(JFXAVMediaDataReader *)self JFX_resetReaderFromTime:&time2];
  }
  else
  {
    *(_OWORD *)&time2.start.value = *(_OWORD *)&range2.start.value;
    time2.start.epoch = range2.start.epoch;
    return [(JFXAVMediaDataReader *)self beginReadingAtTime:&time2];
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_isScrubbing != a3)
  {
    BOOL v3 = a3;
    self->_isScrubbing = a3;
    long long v5 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(JFXAVMediaDataReader *)(uint64_t)self setIsScrubbing:v5];
    }

    long long v6 = JFXMediaDataReaderEventSignpostPointCategory();
    unint64_t v7 = [(JFXAVMediaDataReader *)self signPostID];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v11 = v3;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v6, OS_SIGNPOST_EVENT, v8, "ScrubModeChanged", "scrubbingMode set to %{BOOL}d", buf, 8u);
      }
    }

    if ([(JFXAVMediaDataReader *)self status] == 1)
    {
      [(JFXAVMediaDataReader *)self startTimeOfCurrentData];
      [(JFXAVMediaDataReader *)self JFX_resetReaderFromTime:v9];
    }
  }
}

- (BOOL)beginReadingAtTime:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t v5 = [(JFXAVMediaDataReader *)self status];
  if (v5 != 1)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a3;
    double Seconds = CMTimeGetSeconds((CMTime *)&v19);
    unint64_t v7 = JFXMediaDataReaderIntervalSignpostCategory();
    unint64_t v8 = [(JFXAVMediaDataReader *)self signPostID];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        LODWORD(v19.var0) = 134217984;
        *(double *)((char *)&v19.var0 + 4) = Seconds;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "beginReadingAtTime", "beginReading %f", (uint8_t *)&v19, 0xCu);
      }
    }

    long long v10 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(JFXAVMediaDataReader *)self beginReadingAtTime:Seconds];
    }

    BOOL v11 = [(JFXAVMediaDataReader *)self createAssetReader];
    [(JFXAVMediaDataReader *)self setAssetReader:v11];

    uint64_t v12 = [(JFXAVMediaDataReader *)self assetReader];

    if (!v12) {
      goto LABEL_11;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a3;
    [(JFXAVMediaDataReader *)self JFX_configureAssetReaderToReadFromTime:&v19];
    unint64_t v13 = [(JFXAVMediaDataReader *)self createAssetReaderTrackOutput];
    [(JFXAVMediaDataReader *)self setAssetReaderTrackOutput:v13];

    os_signpost_id_t v14 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];

    if (!v14) {
      goto LABEL_11;
    }
    [(JFXAVMediaDataReader *)self JFX_configureAssetReaderTrackOutput];
    LODWORD(v5) = [(JFXAVMediaDataReader *)self prepareAssetReaderForReading];
    if (v5)
    {
      if ([(JFXAVMediaDataReader *)self status] == 2)
      {
LABEL_11:
        LOBYTE(v5) = 0;
        return v5;
      }
      [(JFXAVMediaDataReader *)self setStatus:1];
      [(JFXAVMediaDataReader *)self didUpdateReadingRange];
      v15 = JFXMediaDataReaderIntervalSignpostCategory();
      unint64_t v16 = [(JFXAVMediaDataReader *)self signPostID];
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          LOWORD(v19.var0) = 0;
          _os_signpost_emit_with_name_impl(&dword_234C41000, v15, OS_SIGNPOST_INTERVAL_END, v17, "beginReadingAtTime", (const char *)&unk_234D6C482, (uint8_t *)&v19, 2u);
        }
      }

      LOBYTE(v5) = [(JFXAVMediaDataReader *)self status] != 2;
    }
  }
  return v5;
}

- (void)JFX_configureAssetReaderToReadFromTime:(id *)a3
{
  memset(&v14, 0, sizeof(v14));
  memset(&v13, 0, sizeof(v13));
  [(JFXAVMediaDataReader *)self readableTimeRange];
  CMTimeRangeGetEnd(&v13, &range);
  if ([(JFXAVMediaDataReader *)self isScrubbing])
  {
    memset(&start, 0, sizeof(start));
    CMTime lhs = (CMTime)*a3;
    *(_OWORD *)&rhs.value = kDefaultScrubbingReadingRangeDuration;
    rhs.epoch = 0;
    CMTimeAdd(&start, &lhs, &rhs);
    CMTime lhs = start;
    CMTime rhs = v13;
    if (CMTimeCompare(&lhs, &rhs) < 0) {
      CMTime v13 = start;
    }
  }
  CMTime start = (CMTime)*a3;
  CMTime lhs = v13;
  CMTimeRangeFromTimeToTime(&v14, &start, &lhs);
  CMTimeRange v8 = v14;
  [(JFXAVMediaDataReader *)self setCurrentReadingRange:&v8];
  CMTimeRange v7 = v14;
  int64_t v5 = [(JFXAVMediaDataReader *)self assetReader];
  CMTimeRange v6 = v7;
  [v5 setTimeRange:&v6];
}

- (void)setCurrentReadingRange:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v5 = *(_OWORD *)&a3->var0.var0;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_currentReadingRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_currentReadingRange.start.epoch = v6;
  *(_OWORD *)&self->_currentReadingRange.start.value = v5;
  CMTimeRange v7 = JFXLog_DebugMediaDataReader();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    os_signpost_id_t v9 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)CMTime time = *(_OWORD *)&a3->var0.var0;
      *(void *)&time[16] = a3->var0.var3;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
      long long v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)CMTime time = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&time[16] = v11;
      *(_OWORD *)long long v25 = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v23, (CMTimeRange *)time);
      Float64 v12 = CMTimeGetSeconds(&v23);
      [(JFXAVMediaDataReader *)self readableTimeRange];
      CMTime v22 = v21;
      Float64 v13 = CMTimeGetSeconds(&v22);
      [(JFXAVMediaDataReader *)self readableTimeRange];
      CMTimeRangeGetEnd(&v20, &range);
      Float64 v14 = CMTimeGetSeconds(&v20);
      v15 = [(JFXAVMediaDataReader *)self asset];
      unint64_t v16 = v15;
      if (v15) {
        [v15 duration];
      }
      else {
        memset(&v18, 0, sizeof(v18));
      }
      Float64 v17 = CMTimeGetSeconds(&v18);
      *(_DWORD *)CMTime time = 138413570;
      *(void *)&time[4] = self;
      *(_WORD *)&time[12] = 2048;
      *(Float64 *)&time[14] = Seconds;
      *(_WORD *)&time[22] = 2048;
      *(Float64 *)&time[24] = v12;
      *(_WORD *)long long v25 = 2048;
      *(Float64 *)&v25[2] = v13;
      *(_WORD *)&v25[10] = 2048;
      *(Float64 *)&v25[12] = v14;
      __int16 v26 = 2048;
      Float64 v27 = v17;
      _os_log_debug_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEBUG, "%@ asset reading range configured to start:%f end:%f with overall mediaStart %f, mediaDuration %f assetDuration %f", time, 0x3Eu);
    }
  }
}

- (void)JFX_configureAssetReaderTrackOutput
{
  if ([(JFXAVMediaDataReader *)self isScrubbing])
  {
    BOOL v3 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
    [v3 setSupportsRandomAccess:1];
  }
  id v4 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
  [v4 setAlwaysCopiesSampleData:0];
}

- (id)createAssetReader
{
  BOOL v3 = (void *)MEMORY[0x263EFA4C0];
  id v4 = [(JFXAVMediaDataReader *)self asset];
  id v9 = 0;
  long long v5 = [v3 assetReaderWithAsset:v4 error:&v9];
  id v6 = v9;

  if (v5) {
    id v7 = v5;
  }
  else {
    [(JFXAVMediaDataReader *)self didFailWithError:v6];
  }

  return v5;
}

- (id)createAssetReaderTrackOutput
{
  v2 = (void *)MEMORY[0x263EFA4D8];
  BOOL v3 = [(JFXAVMediaDataReader *)self assetTrack];
  id v4 = [v2 assetReaderTrackOutputWithTrack:v3 outputSettings:0];

  return v4;
}

- (BOOL)prepareAssetReaderForReading
{
  BOOL v3 = [(JFXAVMediaDataReader *)self assetReader];
  id v4 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
  [v3 addOutput:v4];

  long long v5 = [(JFXAVMediaDataReader *)self assetReader];
  char v6 = [v5 startReading];

  if ((v6 & 1) == 0)
  {
    id v7 = [(JFXAVMediaDataReader *)self assetReader];
    BOOL v8 = [v7 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v8];
  }
  return v6;
}

- (BOOL)seekToTime:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(JFXAVMediaDataReader *)self status] == 2) {
    return 0;
  }
  [(JFXAVMediaDataReader *)self readableTimeRange];
  [(JFXAVMediaDataReader *)self minimumFrameDuration];
  CMTime v26 = (CMTime)*a3;
  memset(&v35, 0, sizeof(v35));
  CMTimeRange range = v29;
  CMTimeRangeGetEnd(&lhs, &range);
  *(_OWORD *)&range.start.value = v27;
  range.start.epoch = v28;
  CMTimeSubtract(&v35, &lhs, &range.start);
  memset(&v33, 0, sizeof(v33));
  *(_OWORD *)&range.start.value = *(_OWORD *)&v29.start.value;
  range.start.epoch = v29.start.epoch;
  time2.CMTime start = v35;
  CMTimeMaximum(&v33, &range.start, &time2.start);
  range.CMTime start = v33;
  *(_OWORD *)&time2.start.value = *(_OWORD *)&v29.start.value;
  time2.start.epoch = v29.start.epoch;
  if (CMTimeCompare(&range.start, &time2.start))
  {
    memset(&range, 0, sizeof(range));
    *(_OWORD *)&time2.start.value = *(_OWORD *)&v29.start.value;
    time2.start.epoch = v29.start.epoch;
    CMTime end = v33;
    CMTimeRangeFromTimeToTime(&range, &time2.start, &end);
    CMTime end = v26;
    CMTimeRange time2 = range;
    CMTimeClampToRange(&v30, &end, &time2);
  }
  else
  {
    CMTime v30 = v33;
  }
  *(CMTime *)a3 = v30;
  memset(&time2, 0, 24);
  [(JFXAVMediaDataReader *)self startTimeOfCurrentData];
  long long v5 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v6 = [(JFXAVMediaDataReader *)self signPostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
      range.start.epoch = time2.start.epoch;
      Float64 Seconds = CMTimeGetSeconds(&range.start);
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
      range.start.epoch = a3->var3;
      Float64 v9 = CMTimeGetSeconds(&range.start);
      LODWORD(range.start.value) = 134218240;
      *(Float64 *)((char *)&range.start.value + 4) = Seconds;
      LOWORD(range.start.flags) = 2048;
      *(Float64 *)((char *)&range.start.flags + 2) = v9;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Seeking", "seek from %f to %f ", (uint8_t *)&range, 0x16u);
    }
  }

  long long v10 = JFXLog_DebugMediaDataReader();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
    range.start.epoch = time2.start.epoch;
    Float64 v20 = CMTimeGetSeconds(&range.start);
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
    range.start.epoch = a3->var3;
    *(double *)&CMTimeValue v21 = CMTimeGetSeconds(&range.start);
    LODWORD(range.start.value) = 138412802;
    *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)self;
    LOWORD(range.start.flags) = 2048;
    *(Float64 *)((char *)&range.start.flags + 2) = v20;
    HIWORD(range.start.epoch) = 2048;
    range.duration.value = v21;
    _os_log_debug_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEBUG, "%@ seek from %f to %f", (uint8_t *)&range, 0x20u);
  }

  *(_OWORD *)&range.start.value = *(_OWORD *)&time2.start.value;
  range.start.epoch = time2.start.epoch;
  CMTime v35 = (CMTime)*a3;
  [(JFXAVMediaDataReader *)self JFX_resetReaderIfNecessaryToSeekFromStartTimeOfCurrentData:&range toTime:&v35];
  if ([(JFXAVMediaDataReader *)self status] == 2) {
    return 0;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
  range.start.epoch = a3->var3;
  BOOL v11 = [(JFXAVMediaDataReader *)self readAheadToTime:&range];
  Float64 v12 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v13 = [(JFXAVMediaDataReader *)self signPostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      LOWORD(range.start.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v12, OS_SIGNPOST_INTERVAL_END, v14, "Seeking", (const char *)&unk_234D6C482, (uint8_t *)&range, 2u);
    }
  }

  v15 = JFXLog_DebugMediaDataReader();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v16)
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
      range.start.epoch = a3->var3;
      Float64 v17 = CMTimeGetSeconds(&range.start);
      [(JFXAVMediaDataReader *)self startTimeOfCurrentData];
      *(double *)&CMTimeValue v18 = CMTimeGetSeconds(&time);
      LODWORD(range.start.value) = 138412802;
      *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)self;
      LOWORD(range.start.flags) = 2048;
      *(Float64 *)((char *)&range.start.flags + 2) = v17;
      HIWORD(range.start.epoch) = 2048;
      range.duration.value = v18;
      _os_log_debug_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEBUG, "%@ data found for time %f at %f", (uint8_t *)&range, 0x20u);
    }
  }
  else if (v16)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
    range.start.epoch = a3->var3;
    Float64 v22 = CMTimeGetSeconds(&range.start);
    CMTimeValue v23 = [(JFXAVMediaDataReader *)self status];
    CMTime v24 = [(JFXAVMediaDataReader *)self error];
    LODWORD(range.start.value) = 138413058;
    *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)self;
    LOWORD(range.start.flags) = 2048;
    *(Float64 *)((char *)&range.start.flags + 2) = v22;
    HIWORD(range.start.epoch) = 2048;
    range.duration.value = v23;
    LOWORD(range.duration.timescale) = 2112;
    *(void *)((char *)&range.duration.timescale + 2) = v24;
    _os_log_debug_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEBUG, "%@ data not found for time %f, status %ld error %@", (uint8_t *)&range, 0x2Au);
  }
  return v11;
}

- (void)JFX_resetReaderIfNecessaryToSeekFromStartTimeOfCurrentData:(id *)a3 toTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  if ([(JFXAVMediaDataReader *)self JFX_shouldResetReaderWhenSeekingFromStartTimeOfCurrentData:&v7 toTime:&v6])
  {
    if ([(JFXAVMediaDataReader *)self isScrubbing])
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
      [(JFXAVMediaDataReader *)self JFX_resetReadingRangeWhenScrubbingToTime:&v7];
    }
    else
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
      [(JFXAVMediaDataReader *)self JFX_resetReaderFromTime:&v7];
    }
  }
}

- (BOOL)JFX_shouldResetReaderWhenSeekingFromStartTimeOfCurrentData:(id *)a3 toTime:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CMTime time = *(CMTime *)a3;
  Float64 Seconds = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)a4;
  Float64 v8 = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)a4;
  CMTime time2 = *(CMTime *)a3;
  if (CMTimeCompare(&time, &time2) < 0)
  {
    v15 = JFXMediaDataReaderEventSignpostPointCategory();
    unint64_t v16 = [(JFXAVMediaDataReader *)self signPostID];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        LODWORD(time.value) = 134218240;
        *(Float64 *)((char *)&time.value + 4) = Seconds;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = v8;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v15, OS_SIGNPOST_EVENT, v17, "Seeking", "seek backwards from %f to %f", (uint8_t *)&time, 0x16u);
      }
    }

    Float64 v12 = JFXLog_DebugMediaDataReader();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    LODWORD(time.value) = 138412802;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = Seconds;
    HIWORD(time.epoch) = 2048;
    Float64 v21 = v8;
    unint64_t v13 = "%@ seek backwards from %f to %f";
    goto LABEL_19;
  }
  CMTime time = (CMTime)*a4;
  CMTime time2 = (CMTime)*a3;
  if (CMTimeCompare(&time, &time2) >= 1)
  {
    CMTime time = (CMTime)*a3;
    CMTime time2 = (CMTime)*a4;
    if ([(JFXAVMediaDataReader *)self seekingAheadIsExpensiveFromTime:&time toTime:&time2])
    {
      Float64 v9 = JFXMediaDataReaderEventSignpostPointCategory();
      unint64_t v10 = [(JFXAVMediaDataReader *)self signPostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          LODWORD(time.value) = 134218240;
          *(Float64 *)((char *)&time.value + 4) = Seconds;
          LOWORD(time.flags) = 2048;
          *(Float64 *)((char *)&time.flags + 2) = v8;
          _os_signpost_emit_with_name_impl(&dword_234C41000, v9, OS_SIGNPOST_EVENT, v11, "Seeking", "large seek forward from %f to %f", (uint8_t *)&time, 0x16u);
        }
      }

      Float64 v12 = JFXLog_DebugMediaDataReader();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      LODWORD(time.value) = 138412802;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)self;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = Seconds;
      HIWORD(time.epoch) = 2048;
      Float64 v21 = v8;
      unint64_t v13 = "%@ large seek forward from %f to %f";
LABEL_19:
      _os_log_debug_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&time, 0x20u);
LABEL_16:

      return 1;
    }
  }
  if (![(JFXAVMediaDataReader *)self isScrubbing]) {
    return 0;
  }
  [(JFXAVMediaDataReader *)self currentReadingRange];
  CMTime time = (CMTime)*a4;
  return !CMTimeRangeContainsTime(&v18, &time);
}

- (BOOL)seekingAheadIsExpensiveFromTime:(id *)a3 toTime:(id *)a4
{
  CMTime v7 = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&v7);
  CMTime v7 = *(CMTime *)a4;
  return CMTimeGetSeconds(&v7) - Seconds > 1.0;
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  long long v5 = JFXLog_mediaDataReader();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(JFXAVMediaDataReader *)(uint64_t)self didFailWithError:v5];
  }

  [(JFXAVMediaDataReader *)self setError:v4];
  [(JFXAVMediaDataReader *)self setStatus:2];
}

- (BOOL)JFX_resetReaderFromTime:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  Float64 Seconds = CMTimeGetSeconds((CMTime *)&v15);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v7 = [(JFXAVMediaDataReader *)self signPostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LODWORD(v15.var0) = 134217984;
      *(Float64 *)((char *)&v15.var0 + 4) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "resetReader", "resetReaderAtTime %f", (uint8_t *)&v15, 0xCu);
    }
  }

  Float64 v9 = JFXLog_DebugMediaDataReader();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[JFXAVMediaDataReader JFX_resetReaderFromTime:]();
  }

  [(JFXAVMediaDataReader *)self cancelReadingForReaderReset];
  [(JFXAVMediaDataReader *)self JFX_releaseReadersForReset];
  [(JFXAVMediaDataReader *)self setStatus:0];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  BOOL v10 = [(JFXAVMediaDataReader *)self beginReadingAtTime:&v15];
  os_signpost_id_t v11 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v12 = [(JFXAVMediaDataReader *)self signPostID];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v15.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v11, OS_SIGNPOST_INTERVAL_END, v13, "resetReader", (const char *)&unk_234D6C482, (uint8_t *)&v15, 2u);
    }
  }

  return v10;
}

- (void)cancelReadingForReaderReset
{
  id v2 = [(JFXAVMediaDataReader *)self assetReader];
  [v2 cancelReading];
}

- (void)JFX_releaseReadersForReset
{
  [(JFXAVMediaDataReader *)self setAssetReader:0];
  [(JFXAVMediaDataReader *)self setAssetReaderTrackOutput:0];
}

- (void)JFX_resetReadingRangeWhenScrubbingToTime:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  time.CMTimeRange start = (CMTime)*a3;
  Float64 Seconds = CMTimeGetSeconds(&time.start);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = JFXMediaDataReaderIntervalSignpostCategory();
  unint64_t v7 = [(JFXAVMediaDataReader *)self signPostID];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LODWORD(time.start.value) = 134217984;
      *(Float64 *)((char *)&time.start.value + 4) = Seconds;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "resetReadingRangeWhenScrubbingToTime", "reset when scrubbing at %f", (uint8_t *)&time, 0xCu);
    }
  }

  Float64 v9 = JFXLog_DebugMediaDataReader();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[JFXAVMediaDataReader JFX_resetReadingRangeWhenScrubbingToTime:]();
  }

  if (![(JFXAVMediaDataReader *)self hasRemainingAvailableData]
    || ([(JFXAVMediaDataReader *)self readAndDiscardRemainingAvailableData],
        [(JFXAVMediaDataReader *)self status] != 2))
  {
    memset(&time, 0, sizeof(time));
    *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0;
    start.start.epoch = a3->var3;
    *(_OWORD *)&duration.value = kDefaultScrubbingReadingRangeDuration;
    duration.epoch = 0;
    CMTimeRangeMake(&time, &start.start, &duration);
    CMTimeRange start = time;
    BOOL v10 = [MEMORY[0x263F08D40] valueWithCMTimeRange:&start];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = v10;
    os_signpost_id_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];

    unint64_t v12 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
    [v12 resetForReadingTimeRanges:v11];

    CMTimeRange v16 = time;
    [(JFXAVMediaDataReader *)self setCurrentReadingRange:&v16];
    [(JFXAVMediaDataReader *)self didUpdateReadingRange];
    os_signpost_id_t v13 = JFXMediaDataReaderIntervalSignpostCategory();
    unint64_t v14 = [(JFXAVMediaDataReader *)self signPostID];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        LOWORD(start.start.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_234C41000, v13, OS_SIGNPOST_INTERVAL_END, v15, "resetReadingRangeWhenScrubbingToTime", (const char *)&unk_234D6C482, (uint8_t *)&start, 2u);
      }
    }
  }
}

- (void)didUpdateReadingRange
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  long long v5 = NSStringFromSelector(a2);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v4 stringWithFormat:@"must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)readAheadToTime:(id *)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  long long v5 = NSString;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)readAndDiscardRemainingAvailableData
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  long long v5 = NSStringFromSelector(a2);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v4 stringWithFormat:@"must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  long long v5 = NSString;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = NSStringFromSelector(a3);
  id v7 = [v5 stringWithFormat:@"must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)hasRemainingAvailableData
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  long long v5 = NSStringFromSelector(a2);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v4 stringWithFormat:@"must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- ($70930193D4F448A53BB9343C0237EB5F)JFX_allMediaTimeRange
{
  uint64_t v4 = [(JFXAVMediaDataReader *)self asset];
  long long v5 = v4;
  if (v4) {
    [v4 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  CMTime v7 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTimeRangeMake((CMTimeRange *)retstr, &v7, &duration);

  return result;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AVAssetTrack)assetTrack
{
  return self->_assetTrack;
}

- (void)setAssetTrack:(id)a3
{
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_assetReaderTrackOutput;
}

- (void)setAssetReaderTrackOutput:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (unint64_t)signPostID
{
  return self->_signPostID;
}

- (void)setSignPostID:(unint64_t)a3
{
  self->_signPostID = a3;
}

- ($70930193D4F448A53BB9343C0237EB5F)readableTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setReadableTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_readableTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_readableTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_readableTimeRange.start.value = v3;
}

- ($70930193D4F448A53BB9343C0237EB5F)currentReadingRange
{
  long long v3 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetReaderTrackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetTrack, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setIsScrubbing:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "%@ scrubbingMode set to %{BOOL}d", (uint8_t *)&v3, 0x12u);
}

- (void)beginReadingAtTime:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 138412802;
  __int16 v5 = a1;
  __int16 v6 = 2048;
  double v7 = a3;
  __int16 v8 = 1024;
  int v9 = [a1 isScrubbing];
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "%@ begin reading for time %f isScrubbing %{BOOL}d", (uint8_t *)&v4, 0x1Cu);
}

- (void)didFailWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "%@ reading did fail, and can no longer be read with error %@", (uint8_t *)&v3, 0x16u);
}

- (void)JFX_resetReaderFromTime:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_234C41000, v0, OS_LOG_TYPE_DEBUG, "%@ reset reader at time %f", v1, 0x16u);
}

- (void)JFX_resetReadingRangeWhenScrubbingToTime:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_234C41000, v0, OS_LOG_TYPE_DEBUG, "%@ resetReadingRangeWhenScrubbingToTime for time %f", v1, 0x16u);
}

@end