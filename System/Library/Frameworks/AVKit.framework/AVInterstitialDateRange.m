@interface AVInterstitialDateRange
- ($B1B40AE7B40192423BFE885F22139C9A)timeRange;
- (AVInterstitialDateRange)initWithStart:(id)a3 end:(id)a4;
- (AVInterstitialDateRange)initWithTimeRange:(id *)a3;
- (BOOL)isEqualToInterstitialTimeRange:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)_initWithTimeRange:(id *)a3;
- (id)description;
- (void)_setPlayerInterstitialEvent:(id)a3;
- (void)_updateMappedStartTime;
- (void)setEndDate:(id)a3;
@end

@implementation AVInterstitialDateRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(AVInterstitialDateRange *)self startDate];
  v5 = [(AVInterstitialDateRange *)self endDate];
  v6 = [v3 stringWithFormat:@"[%@...%@]", v4, v5];

  return v6;
}

- (BOOL)isEqualToInterstitialTimeRange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(AVInterstitialDateRange *)self startDate];
    v7 = [v5 startDate];
    if ([v6 isEqualToDate:v7])
    {
      v8 = [(AVInterstitialDateRange *)self endDate];
      v9 = [v5 endDate];
      if ([v8 isEqualToDate:v9])
      {
        v12.receiver = self;
        v12.super_class = (Class)AVInterstitialDateRange;
        BOOL v10 = [(AVInterstitialTimeRange *)&v12 isEqualToInterstitialTimeRange:v5];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- ($B1B40AE7B40192423BFE885F22139C9A)timeRange
{
  p_mappedTimeRange = &self->_mappedTimeRange;
  if ((self->_mappedTimeRange.start.flags & 1) == 0) {
    [(AVInterstitialDateRange *)self _updateMappedStartTime];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  v7.receiver = self;
  v7.super_class = (Class)AVInterstitialDateRange;
  result = ($B1B40AE7B40192423BFE885F22139C9A *)[($B1B40AE7B40192423BFE885F22139C9A *)&v7 timeRange];
  if ((p_mappedTimeRange->start.flags & 0x1D) == 1)
  {
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&p_mappedTimeRange->start.value;
    retstr->var0.var3 = p_mappedTimeRange->start.epoch;
  }
  return result;
}

- (void)_setPlayerInterstitialEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVInterstitialDateRange;
  [(AVInterstitialTimeRange *)&v4 _setPlayerInterstitialEvent:a3];
  [(AVInterstitialDateRange *)self _updateMappedStartTime];
}

- (void)_updateMappedStartTime
{
  v3 = [(AVInterstitialTimeRange *)self playerInterstitialEvent];
  objc_super v4 = [v3 primaryItem];

  if ([v4 status] == 1)
  {
    id v5 = [v4 currentDate];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v4 currentEstimatedDate];
    }
    v8 = v7;

    if (v4) {
      [v4 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    if (v8)
    {
      double v10 = Seconds;
      [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
      double v12 = v11;
      [v8 timeIntervalSinceReferenceDate];
      CMTimeMakeWithSeconds(&v18, v10 + v12 - v13, 1000);
      self->_mappedTimeRange.start = ($95D729B680665BEAEFA1D6FCA8238556)v18;
      uint64_t v14 = MEMORY[0x1E4F1FA48];
      *(_OWORD *)&self->_mappedTimeRange.duration.value = *MEMORY[0x1E4F1FA48];
      self->_mappedTimeRange.duration.epoch = *(void *)(v14 + 16);
      if (v4)
      {
        [v4 duration];
        if (v17)
        {
          [v4 duration];
          BOOL v15 = (v16 & 0x10) == 0;
        }
        else
        {
          BOOL v15 = 1;
        }
      }
      else
      {
        BOOL v15 = 1;
      }
      [(AVInterstitialTimeRange *)self _setCollapsedInTimeLine:v15];
    }
  }
}

- (void)setEndDate:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (!self->_endDate)
    {
      id v7 = v5;
      [v5 timeIntervalSinceDate:self->_startDate];
      id v5 = v7;
      if (v6 > 0.0)
      {
        objc_storeStrong((id *)&self->_endDate, a3);
        [v7 timeIntervalSinceDate:self->_startDate];
        -[AVInterstitialTimeRange _setDurationTimeInterval:](self, "_setDurationTimeInterval:");
        id v5 = v7;
      }
    }
  }
}

- (AVInterstitialDateRange)initWithStart:(id)a3 end:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  memset(&v23, 0, sizeof(v23));
  double v10 = (CMTime *)MEMORY[0x1E4F1F9F0];
  if (v8)
  {
    [v8 timeIntervalSinceDate:v7];
    CMTimeMakeWithSeconds(&v22, v11, 1000);
    *(_OWORD *)&start.start.value = *MEMORY[0x1E4F1FA48];
    start.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    p_CMTime duration = &v22;
  }
  else
  {
    *(_OWORD *)&start.start.value = *MEMORY[0x1E4F1FA48];
    start.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
    p_CMTime duration = &duration;
  }
  CMTimeRangeMake(&v23, &start.start, p_duration);
  v20.receiver = self;
  v20.super_class = (Class)AVInterstitialDateRange;
  CMTimeRange start = v23;
  double v13 = [(AVInterstitialTimeRange *)&v20 _initWithTimeRange:&start];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 20, a3);
    objc_storeStrong(v14 + 21, a4);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    CMTime v18 = *v10;
    CMTimeRangeMake(&start, &duration, &v18);
    long long v15 = *(_OWORD *)&start.start.value;
    long long v16 = *(_OWORD *)&start.duration.timescale;
    *((_OWORD *)v14 + 8) = *(_OWORD *)&start.start.epoch;
    *((_OWORD *)v14 + 9) = v16;
    *((_OWORD *)v14 + 7) = v15;
    [v14 _setCollapsedInTimeLine:0];
  }

  return (AVInterstitialDateRange *)v14;
}

- (id)_initWithTimeRange:(id *)a3
{
  CMTime time1 = (CMTime)a3->var1;
  CMTime v7 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &v7) >= 1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"cannot specify duration of AVInterstitialDateRange except by providing dates"];
  }
  objc_super v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v5 = [(AVInterstitialDateRange *)self initWithStart:v4 end:0];

  return v5;
}

- (AVInterstitialDateRange)initWithTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  return (AVInterstitialDateRange *)[(AVInterstitialDateRange *)self _initWithTimeRange:v5];
}

@end