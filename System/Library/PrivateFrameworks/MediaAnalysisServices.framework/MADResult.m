@interface MADResult
+ (BOOL)supportsSecureCoding;
- ($1C75447F214D9465CD650DD956230C7F)timerange;
- (MADResult)init;
- (MADResult)initWithCoder:(id)a3;
- (double)executionTimeInterval;
- (unint64_t)executionNanoseconds;
- (void)encodeWithCoder:(id)a3;
- (void)setExecutionNanoseconds:(unint64_t)a3;
@end

@implementation MADResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)MADResult;
  result = [(MADResult *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1FA20];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&result->_timerange.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&result->_timerange.start.epoch = v4;
    *(_OWORD *)&result->_timerange.duration.timescale = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (unint64_t)executionNanoseconds
{
  return self->_executionNanoseconds;
}

- (void)setExecutionNanoseconds:(unint64_t)a3
{
  self->_executionNanoseconds = a3;
}

- (double)executionTimeInterval
{
  return (double)self->_executionNanoseconds / 1000000000.0;
}

- (MADResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADResult;
  objc_super v5 = [(MADResult *)&v7 init];
  if (v5)
  {
    v5->_timerange.start.value = [v4 decodeInt64ForKey:@"TimeRangeStartValue"];
    v5->_timerange.start.timescale = [v4 decodeInt32ForKey:@"TimeRangeStartTimescale"];
    v5->_timerange.start.flags = [v4 decodeInt32ForKey:@"TimeRangeStartFlags"];
    v5->_timerange.start.epoch = [v4 decodeInt64ForKey:@"TimeRangeStartEpoch"];
    v5->_timerange.duration.value = [v4 decodeInt64ForKey:@"TimeRangeDurationValue"];
    v5->_timerange.duration.timescale = [v4 decodeInt32ForKey:@"TimeRangeDurationTimescale"];
    v5->_timerange.duration.flags = [v4 decodeInt32ForKey:@"TimeRangeDurationFlags"];
    v5->_timerange.duration.epoch = [v4 decodeInt64ForKey:@"TimeRangeDurationEpoch"];
    v5->_executionNanoseconds = [v4 decodeInt64ForKey:@"ExecutionNanoseconds"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t value = self->_timerange.start.value;
  id v5 = a3;
  [v5 encodeInt64:value forKey:@"TimeRangeStartValue"];
  [v5 encodeInt32:self->_timerange.start.timescale forKey:@"TimeRangeStartTimescale"];
  [v5 encodeInt32:self->_timerange.start.flags forKey:@"TimeRangeStartFlags"];
  [v5 encodeInt64:self->_timerange.start.epoch forKey:@"TimeRangeStartEpoch"];
  [v5 encodeInt64:self->_timerange.duration.value forKey:@"TimeRangeDurationValue"];
  [v5 encodeInt32:self->_timerange.duration.timescale forKey:@"TimeRangeDurationTimescale"];
  [v5 encodeInt32:self->_timerange.duration.flags forKey:@"TimeRangeDurationFlags"];
  [v5 encodeInt64:self->_timerange.duration.epoch forKey:@"TimeRangeDurationEpoch"];
  [v5 encodeInt64:self->_executionNanoseconds forKey:@"ExecutionNanoseconds"];
}

- ($1C75447F214D9465CD650DD956230C7F)timerange
{
  long long v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

@end