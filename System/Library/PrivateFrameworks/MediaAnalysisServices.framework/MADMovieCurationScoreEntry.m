@interface MADMovieCurationScoreEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithTimeRange:(id *)a3 score:(double)a4;
- ($1C75447F214D9465CD650DD956230C7F)timeRange;
- (MADMovieCurationScoreEntry)initWithCoder:(id)a3;
- (MADMovieCurationScoreEntry)initWithTimeRange:(id *)a3 score:(double)a4;
- (double)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADMovieCurationScoreEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMovieCurationScoreEntry)initWithTimeRange:(id *)a3 score:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MADMovieCurationScoreEntry;
  result = [(MADMovieCurationScoreEntry *)&v9 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0.var0;
    long long v8 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = v8;
    *(_OWORD *)&result->_timeRange.start.value = v7;
    result->_score = a4;
  }
  return result;
}

+ (id)entryWithTimeRange:(id *)a3 score:(double)a4
{
  id v6 = objc_alloc((Class)a1);
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v10[0] = *(_OWORD *)&a3->var0.var0;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a3->var1.var1;
  long long v8 = (void *)[v6 initWithTimeRange:v10 score:a4];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6[0] = *(_OWORD *)&self->_timeRange.start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [v4 encodeCMTimeRange:v6 forKey:@"TimeRange"];
  [v4 encodeDouble:@"Score" forKey:self->_score];
}

- (MADMovieCurationScoreEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMovieCurationScoreEntry;
  long long v5 = [(MADMovieCurationScoreEntry *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      [v4 decodeCMTimeRangeForKey:@"TimeRange"];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    *(_OWORD *)&v5->_timeRange.start.value = v8;
    *(_OWORD *)&v5->_timeRange.start.epoch = v9;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", @"Score", v8, v9, v10);
    v5->_score = v6;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  CMTime time = (CMTime)self->_timeRange.start;
  Float64 Seconds = CMTimeGetSeconds(&time);
  long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetEnd(&v10, &range);
  [v3 appendFormat:@"%@: %-.4fs-%-.4fs, ", @"TimeRange", *(void *)&Seconds, CMTimeGetSeconds(&v10)];
  [v3 appendFormat:@"%@: %.2f>", @"Score", *(void *)&self->_score];
  return v3;
}

- ($1C75447F214D9465CD650DD956230C7F)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (double)score
{
  return self->_score;
}

@end