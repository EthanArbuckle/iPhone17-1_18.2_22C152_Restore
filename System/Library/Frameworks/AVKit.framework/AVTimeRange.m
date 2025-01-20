@interface AVTimeRange
+ (AVTimeRange)timeRangeWithInterstice:(id)a3;
+ (id)timeRangeZero;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startCMTime;
- ($B1B40AE7B40192423BFE885F22139C9A)cmTimeRange;
- (AVInterstitialDateRange)dateBasedInterstice;
- (AVInterstitialTimeRange)interstice;
- (AVTimeRange)init;
- (AVTimeRange)initWithAVTimedMetadataGroup:(id)a3;
- (AVTimeRange)initWithCMTimeRange:(id *)a3;
- (AVTimeRange)initWithStartTime:(double)a3 duration:(double)a4;
- (AVTimeRange)initWithStartTime:(double)a3 endTime:(double)a4;
- (AVTimeRange)initWithUnionOfCMTimeRanges:(id)a3;
- (BOOL)containsDate:(id)a3;
- (BOOL)containsTime:(double)a3;
- (BOOL)isCollapsedInTimeLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeRange:(id)a3;
- (BOOL)isHidden;
- (BOOL)isSkipped;
- (BOOL)isUnmarked;
- (BOOL)requiresLinearPlaybackForTime:(double)a3;
- (NSDate)startDate;
- (double)deltaTimeFromOutsideTime:(double)a3;
- (double)duration;
- (double)endTime;
- (double)pinnedTime:(double)a3;
- (double)startTime;
- (double)timeForDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateForTime:(double)a3;
- (id)description;
- (id)endDate;
- (id)timeRangeByAddingTimeInterval:(double)a3;
- (id)timeRangeByAddingTimeInterval:(double)a3 shiftingDates:(BOOL)a4;
- (id)timeRangeExcludingTimeRange:(id)a3;
- (id)timeRangeIntersectingWithTimeRange:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setMapDate:(id)a3 toTime:(double)a4;
- (void)setMapTime:(double)a3 toDate:(id)a4;
- (void)setStartDate:(id)a3;
@end

@implementation AVTimeRange

- (BOOL)requiresLinearPlaybackForTime:(double)a3
{
  v4 = self;
  v5 = [(AVTimeRange *)self interstice];
  v6 = [v5 playerInterstitialEvent];
  v7 = v6;
  if (v6)
  {
    v4 = (void *)(((unint64_t)[v6 restrictions] >> 2) & 1);
  }
  else if (v5 && [v4 containsTime:a3])
  {
    [v4 startTime];
    double v9 = v8;
    [v5 linearPlaybackRequirementDuration];
    LOBYTE(v4) = v9 + v10 > a3;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (BOOL)isUnmarked
{
  v3 = [(AVTimeRange *)self interstice];
  if (v3)
  {
    v4 = [(AVTimeRange *)self interstice];
    char v5 = [v4 isUnmarked];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isCollapsedInTimeLine
{
  v3 = [(AVTimeRange *)self interstice];
  if (v3)
  {
    v4 = [(AVTimeRange *)self interstice];
    char v5 = [v4 isCollapsedInTimeLine];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isSkipped
{
  v3 = [(AVTimeRange *)self interstice];
  if (v3)
  {
    v4 = [(AVTimeRange *)self interstice];
    char v5 = [v4 isSkipped];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isHidden
{
  v3 = [(AVTimeRange *)self interstice];
  if (v3)
  {
    v4 = [(AVTimeRange *)self interstice];
    char v5 = [v4 isHidden];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (AVInterstitialDateRange)dateBasedInterstice
{
  v2 = [(AVTimeRange *)self interstice];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (AVInterstitialTimeRange)interstice
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return [(AVTimeRange *)v3 interstice];
}

+ (AVTimeRange)timeRangeWithInterstice:(id)a3
{
  id v3 = a3;
  v4 = [[AVTimeRangeForInterstitial alloc] initWithInterstice:v3];

  return (AVTimeRange *)v4;
}

- (void).cxx_destruct
{
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F166B8]);
  [v3 setStyle:1];
  [v3 setFormatTemplate:60.0];
  v4 = NSString;
  [(AVTimeRange *)self startTime];
  char v5 = objc_msgSend(v3, "stringFromSeconds:");
  [(AVTimeRange *)self endTime];
  v6 = objc_msgSend(v3, "stringFromSeconds:");
  v7 = [v4 stringWithFormat:@"[%@...%@]", v5, v6];

  double v8 = [(AVTimeRange *)self startDate];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v9 setDateStyle:0];
    [v9 setTimeStyle:2];
    [(AVTimeRange *)self duration];
    double v10 = objc_msgSend(v8, "dateByAddingTimeInterval:");
    v11 = [v9 stringFromDate:v8];
    v12 = [v9 stringFromDate:v10];
    id v13 = [v7 stringByAppendingFormat:@" (-> [%@...%@])", v11, v12];
  }
  else
  {
    id v13 = v7;
  }

  return v13;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(AVTimeRange *)self startTime];
  double v6 = v5;
  [v4 startTime];
  if (vabdd_f64(v6, v7) <= 0.0000001)
  {
    [(AVTimeRange *)self duration];
    double v12 = v11;
    [v4 duration];
    if (vabdd_f64(v12, v13) <= 0.0000001)
    {
      int64_t v15 = 0;
      goto LABEL_9;
    }
    [(AVTimeRange *)self duration];
    double v9 = v14;
    [v4 duration];
  }
  else
  {
    [(AVTimeRange *)self startTime];
    double v9 = v8;
    [v4 startTime];
  }
  if (v9 >= v10) {
    int64_t v15 = 1;
  }
  else {
    int64_t v15 = -1;
  }
LABEL_9:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [(AVTimeRange *)self isEqualToTimeRange:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTimeRange;
    unsigned __int8 v5 = [(AVTimeRange *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isEqualToTimeRange:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  unsigned __int8 v5 = [(AVTimeRange *)self startDate];
  if (v5)
  {
    BOOL v6 = [v4 startDate];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  [(AVTimeRange *)self startTime];
  double v9 = v8;
  [v4 startTime];
  if (vabdd_f64(v9, v10) < 0.0000001)
  {
    [(AVTimeRange *)self duration];
    double v12 = v11;
    [v4 duration];
    double v14 = vabdd_f64(v12, v13);
    char v15 = v14 < 0.0000001;
    char v16 = v14 >= 0.0000001 || v7;
    if ((v16 & 1) == 0)
    {
      v17 = [(AVTimeRange *)self startDate];
      v18 = [v4 startDate];
      char v15 = [v17 isEqualToDate:v18];
    }
  }
  else
  {
LABEL_11:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  [(AVTimeRange *)self startTime];
  unint64_t v4 = vcvtd_n_u64_f64(v3, 0x10uLL);
  [(AVTimeRange *)self duration];
  return vcvtd_n_u64_f64(v5, 2uLL) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[AVTimeRange allocWithZone:a3];
  [(AVTimeRange *)self startTime];
  double v6 = v5;
  [(AVTimeRange *)self duration];

  return [(AVTimeRange *)v4 initWithStartTime:v6 duration:v7];
}

- (id)timeRangeByAddingTimeInterval:(double)a3
{
  return [(AVTimeRange *)self timeRangeByAddingTimeInterval:0 shiftingDates:a3];
}

- (id)timeRangeByAddingTimeInterval:(double)a3 shiftingDates:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [AVTimeRange alloc];
  [(AVTimeRange *)self startTime];
  double v9 = v8 + a3;
  [(AVTimeRange *)self duration];
  double v11 = [(AVTimeRange *)v7 initWithStartTime:v9 duration:v10];
  double v12 = v11;
  if (v4) {
    double v11 = self;
  }
  [(AVTimeRange *)v11 startTime];
  double v14 = v13;
  char v15 = [(AVTimeRange *)self startDate];
  [(AVTimeRange *)v12 setMapTime:v15 toDate:v14];

  return v12;
}

- (id)timeRangeExcludingTimeRange:(id)a3
{
  id v4 = a3;
  [v4 startTime];
  double v6 = v5;
  [(AVTimeRange *)self endTime];
  if (v6 >= v7 || ([v4 endTime], double v9 = v8, -[AVTimeRange startTime](self, "startTime"), v9 <= v10))
  {
    v25 = self;
  }
  else
  {
    [(AVTimeRange *)self startTime];
    double v12 = v11;
    [v4 startTime];
    double v14 = v13;
    [(AVTimeRange *)self startTime];
    double v16 = v15;
    if (v12 > v14)
    {
      [v4 endTime];
      if (v16 < v17) {
        double v16 = v17;
      }
    }
    [(AVTimeRange *)self endTime];
    double v19 = v18;
    [v4 endTime];
    double v21 = v20;
    [(AVTimeRange *)self endTime];
    double v23 = v22;
    if (v19 < v21)
    {
      [v4 startTime];
      if (v23 >= v24) {
        double v23 = v24;
      }
    }
    if (v23 <= v16)
    {
      v25 = +[AVTimeRange timeRangeZero];
    }
    else
    {
      v25 = [[AVTimeRange alloc] initWithStartTime:v16 endTime:v23];
    }
  }
  v26 = v25;

  return v26;
}

- (id)timeRangeIntersectingWithTimeRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(AVTimeRange *)self startTime];
    double v6 = v5;
    [v4 startTime];
    if (v6 < v7) {
      double v6 = v7;
    }
    [(AVTimeRange *)self endTime];
    double v9 = v8;
    [v4 endTime];
    if (v9 >= v10) {
      double v9 = v10;
    }
    if (v9 <= v6)
    {
      double v11 = +[AVTimeRange timeRangeZero];
    }
    else
    {
      double v11 = [[AVTimeRange alloc] initWithStartTime:v6 endTime:v9];
      double v12 = [(AVTimeRange *)self startDate];

      if (v12)
      {
        [(AVTimeRange *)self startTime];
        double v14 = v13;
        double v15 = [(AVTimeRange *)self startDate];
        [(AVTimeRange *)v11 setMapTime:v15 toDate:v14];
      }
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (double)pinnedTime:(double)a3
{
  [(AVTimeRange *)self deltaTimeFromOutsideTime:a3];
  return a3 - v4;
}

- (double)deltaTimeFromOutsideTime:(double)a3
{
  [(AVTimeRange *)self startTime];
  double v6 = a3 - v5;
  [(AVTimeRange *)self endTime];
  double result = a3 - v7;
  if (result < 0.0) {
    double result = 0.0;
  }
  if (v6 < 0.0) {
    return v6;
  }
  return result;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTimeRange *)self startDate];

  if (v5
    && ([(AVTimeRange *)self startDate],
        double v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 compare:v4],
        v6,
        (unint64_t)(v7 + 1) <= 1))
  {
    double v8 = [(AVTimeRange *)self endDate];
    BOOL v9 = [v4 compare:v8] == -1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)containsTime:(double)a3
{
  [(AVTimeRange *)self startTime];
  if (v5 > a3) {
    return 0;
  }
  [(AVTimeRange *)self endTime];
  return v7 > a3;
}

- (id)endDate
{
  double v3 = [(AVTimeRange *)self startDate];
  [(AVTimeRange *)self duration];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

  return v4;
}

- ($B1B40AE7B40192423BFE885F22139C9A)cmTimeRange
{
  [(AVTimeRange *)self startCMTime];
  [(AVTimeRange *)self endCMTime];
  return ($B1B40AE7B40192423BFE885F22139C9A *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v6);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endCMTime
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(AVTimeRange *)self endTime];
  if (fabs(v6) == INFINITY
    || (double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(AVTimeRange *)self duration], fabs(v7) == INFINITY))
  {
    uint64_t v9 = MEMORY[0x1E4F1F9F0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F0];
    retstr->var3 = *(void *)(v9 + 16);
  }
  else
  {
    [(AVTimeRange *)self duration];
    [(AVTimeRange *)self endTime];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v8, 10000);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startCMTime
{
  [(AVTimeRange *)self startTime];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 10000);
}

- (double)endTime
{
  [(AVTimeRange *)self startTime];
  double v4 = v3;
  [(AVTimeRange *)self duration];
  return v4 + v5;
}

- (double)timeForDate:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTimeRange *)self startDate];
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
    [(AVTimeRange *)self startTime];
    double v9 = v7 + v8;
  }
  else
  {
    double v9 = NAN;
  }

  return v9;
}

- (id)dateForTime:(double)a3
{
  double v5 = [(AVTimeRange *)self startDate];
  [(AVTimeRange *)self startTime];
  double v7 = [v5 dateByAddingTimeInterval:a3 - v6];

  return v7;
}

- (void)setMapDate:(id)a3 toTime:(double)a4
{
  id v6 = a3;
  double v7 = [(AVTimeRange *)self startDate];
  if (!v7)
  {
    double v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_ERROR, "setMapDate:toTime: expects startDate to be valid. Did the caller want setMapTime:toDate: instead?", buf, 2u);
    }
  }
  [v6 timeIntervalSinceDate:v7];
  double v10 = v9 + a4;
  [(AVTimeRange *)self willChangeValueForKey:@"startTime"];
  self->_startTime = v10;
  [(AVTimeRange *)self didChangeValueForKey:@"startTime"];
}

- (void)setMapTime:(double)a3 toDate:(id)a4
{
  id v6 = a4;
  [(AVTimeRange *)self startTime];
  id v8 = [v6 dateByAddingTimeInterval:v7 - a3];

  [(AVTimeRange *)self setStartDate:v8];
}

- (AVTimeRange)initWithUnionOfCMTimeRanges:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CMTimeValue value = *MEMORY[0x1E4F1FA20];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  CMTimeValue v5 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
  CMTimeScale v6 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
  CMTimeFlags v7 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
  CMTimeEpoch v25 = *(void *)(MEMORY[0x1E4F1FA20] + 16);
  CMTimeEpoch v26 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          memset(&buf, 0, sizeof(buf));
          if (v12) {
            [v12 CMTimeRangeValue];
          }
          if ((flags & 1) == 0 || (v7 & 1) == 0 || v26 || v5 < 0)
          {
            CMTimeValue value = buf.start.value;
            CMTimeFlags flags = buf.start.flags;
            CMTimeScale timescale = buf.start.timescale;
            CMTimeValue v5 = buf.duration.value;
            CMTimeEpoch epoch = buf.start.epoch;
            CMTimeScale v6 = buf.duration.timescale;
            CMTimeFlags v7 = buf.duration.flags;
            CMTimeEpoch v14 = buf.duration.epoch;
          }
          else
          {
            range.start.CMTimeValue value = value;
            range.start.CMTimeScale timescale = timescale;
            range.start.CMTimeFlags flags = flags;
            range.start.CMTimeEpoch epoch = v25;
            range.duration.CMTimeValue value = v5;
            range.duration.CMTimeScale timescale = v6;
            range.duration.CMTimeFlags flags = v7;
            range.duration.CMTimeEpoch epoch = 0;
            CMTimeRange otherRange = buf;
            CMTimeRangeGetUnion(&v29, &range, &otherRange);
            CMTimeValue value = v29.start.value;
            CMTimeFlags flags = v29.start.flags;
            CMTimeScale timescale = v29.start.timescale;
            CMTimeEpoch epoch = v29.start.epoch;
            CMTimeValue v5 = v29.duration.value;
            CMTimeScale v6 = v29.duration.timescale;
            CMTimeFlags v7 = v29.duration.flags;
            CMTimeEpoch v14 = v29.duration.epoch;
          }
          CMTimeEpoch v25 = epoch;
          CMTimeEpoch v26 = v14;
        }
        else
        {
          uint64_t v15 = v9;
          double v16 = _AVLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            double v17 = (objc_class *)objc_opt_class();
            double v18 = NSStringFromClass(v17);
            LODWORD(buf.start.value) = 136315650;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[AVTimeRange initWithUnionOfCMTimeRanges:]";
            LOWORD(buf.start.flags) = 2114;
            *(void *)((char *)&buf.start.flags + 2) = v18;
            HIWORD(buf.start.epoch) = 2048;
            buf.duration.CMTimeValue value = (CMTimeValue)v12;
            _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "%s There's a loadedTimeRange that doesn't respond to -CMTimeRangeValue (<%{public}@ %p>)", (uint8_t *)&buf, 0x20u);

            uint64_t v10 = v23;
          }

          uint64_t v9 = v15;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }
  if ((flags & 1) == 0 || (v7 & 1) == 0 || v26 || v5 < 0)
  {
    CMTimeValue value = *MEMORY[0x1E4F1FA30];
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 12);
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 8);
    CMTimeValue v5 = *(void *)(MEMORY[0x1E4F1FA30] + 24);
    CMTimeEpoch v25 = *(void *)(MEMORY[0x1E4F1FA30] + 16);
    CMTimeScale v6 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 32);
    CMTimeFlags v7 = *(_DWORD *)(MEMORY[0x1E4F1FA30] + 36);
    CMTimeEpoch v19 = *(void *)(MEMORY[0x1E4F1FA30] + 40);
  }
  else
  {
    CMTimeEpoch v19 = 0;
  }
  buf.start.CMTimeValue value = value;
  buf.start.CMTimeScale timescale = timescale;
  buf.start.CMTimeFlags flags = flags;
  buf.start.CMTimeEpoch epoch = v25;
  buf.duration.CMTimeValue value = v5;
  *(void *)&buf.duration.CMTimeScale timescale = __PAIR64__(v7, v6);
  buf.duration.CMTimeEpoch epoch = v19;
  double v20 = [(AVTimeRange *)self initWithCMTimeRange:&buf];

  return v20;
}

- (AVTimeRange)initWithAVTimedMetadataGroup:(id)a3
{
  if (a3) {
    [a3 timeRange];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  return [(AVTimeRange *)self initWithCMTimeRange:v5];
}

- (AVTimeRange)initWithCMTimeRange:(id *)a3
{
  double Seconds = 0.0;
  if ((a3->var0.var2 & 1) != 0
    && (unsigned int var2 = a3->var1.var2, (var2 & 1) != 0)
    && !a3->var1.var3
    && (a3->var0.var2 & 0x1D) == 1
    && (p_var1 = &a3->var1, (a3->var1.var0 & 0x8000000000000000) == 0))
  {
    if ((a3->var1.var2 & 0x1D) == 1 || (double v6 = 0.0, (var2 & 0x10) != 0))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a3->var0;
      double Seconds = CMTimeGetSeconds((CMTime *)&var0);
      $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = *p_var1;
      double v6 = CMTimeGetSeconds((CMTime *)&var0);
    }
  }
  else
  {
    double v6 = 0.0;
  }
  return [(AVTimeRange *)self initWithStartTime:Seconds duration:v6];
}

- (AVTimeRange)initWithStartTime:(double)a3 endTime:(double)a4
{
  return [(AVTimeRange *)self initWithStartTime:a3 duration:a4 - a3];
}

- (AVTimeRange)initWithStartTime:(double)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVTimeRange;
  double result = [(AVTimeRange *)&v7 init];
  if (result)
  {
    result->_startTime = a3;
    result->_duration = a4;
  }
  return result;
}

- (AVTimeRange)init
{
  return [(AVTimeRange *)self initWithStartTime:0.0 duration:0.0];
}

+ (id)timeRangeZero
{
  if (timeRangeZero_onceToken != -1) {
    dispatch_once(&timeRangeZero_onceToken, &__block_literal_global_23096);
  }
  v2 = (void *)timeRangeZero_timeRangeZero;

  return v2;
}

uint64_t __28__AVTimeRange_timeRangeZero__block_invoke()
{
  v0 = [[AVTimeRange alloc] initWithStartTime:0.0 duration:0.0];
  uint64_t v1 = timeRangeZero_timeRangeZero;
  timeRangeZero_timeRangeZero = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end