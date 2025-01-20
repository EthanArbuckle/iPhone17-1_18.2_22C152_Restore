@interface MPAdTimeRange
- (BOOL)isEqual:(id)a3;
- (CMTimeRange)timeRange;
- (MPAdTimeRange)initWithTimeRange:(CMTimeRange *)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setTimeRange:(CMTimeRange *)timeRange;
@end

@implementation MPAdTimeRange

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  long long v3 = *(_OWORD *)&timeRange->start.value;
  long long v4 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (CMTimeRange)timeRange
{
  long long v3 = *(_OWORD *)&self->duration.value;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&self->start.timescale;
  *(_OWORD *)&retstr->start.epoch = v3;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&self->duration.epoch;
  return self;
}

- (id)description
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [(MPAdTimeRange *)self timeRange];
  v7 = (__CFString *)CMTimeRangeCopyDescription(v6, &range);
  v8 = [v3 stringWithFormat:@"<%@ %p: %@=%@>", v5, self, @"timeRange", v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = objc_alloc_init(MPAdTimeRange);
  [(MPAdTimeRange *)self timeRange];
  long long v5 = v8;
  long long v6 = v9;
  *(_OWORD *)&v4->_timeRange.duration.timescale = v10;
  *(_OWORD *)&v4->_timeRange.start.epoch = v6;
  *(_OWORD *)&v4->_timeRange.start.value = v5;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [(MPAdTimeRange *)self timeRange];
  if (v4) {
    [v4 timeRange];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  BOOL v5 = CMTimeRangeEqual(&range1, &v7) != 0;

  return v5;
}

- (MPAdTimeRange)initWithTimeRange:(CMTimeRange *)timeRange
{
  v7.receiver = self;
  v7.super_class = (Class)MPAdTimeRange;
  result = [(MPAdTimeRange *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&timeRange->start.value;
    long long v6 = *(_OWORD *)&timeRange->start.epoch;
    *(_OWORD *)&result->_timeRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
    *(_OWORD *)&result->_timeRange.start.epoch = v6;
    *(_OWORD *)&result->_timeRange.start.value = v5;
  }
  return result;
}

@end