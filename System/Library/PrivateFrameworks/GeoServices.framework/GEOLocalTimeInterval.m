@interface GEOLocalTimeInterval
+ (BOOL)supportsSecureCoding;
- (GEOLocalTimeInterval)init;
- (GEOLocalTimeInterval)initWithCoder:(id)a3;
- (GEOLocalTimeInterval)initWithLocalTimeRange:(GEOPDLocalTimeRange *)a3;
- (GEOLocalTimeInterval)initWithStartTime:(double)a3 endTime:(double)a4;
- (double)endTime;
- (double)startTime;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation GEOLocalTimeInterval

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOLocalTimeInterval)init
{
  result = (GEOLocalTimeInterval *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOLocalTimeInterval)initWithLocalTimeRange:(GEOPDLocalTimeRange *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GEOLocalTimeInterval;
  v4 = [(GEOLocalTimeInterval *)&v9 init];
  v5 = v4;
  if (v4)
  {
    if ((~*(unsigned char *)&a3->var2 & 3) != 0)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6.i64[0] = *(void *)&a3->var0;
    v6.i64[1] = HIDWORD(*(void *)&a3->var0);
    *(float64x2_t *)(v4 + 8) = vcvtq_f64_u64(v6);
  }
  v7 = v4;
LABEL_6:

  return v7;
}

- (GEOLocalTimeInterval)initWithStartTime:(double)a3 endTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocalTimeInterval;
  result = [(GEOLocalTimeInterval *)&v7 init];
  if (result)
  {
    result->_startTime = a3;
    result->_endTime = a4;
  }
  return result;
}

- (GEOLocalTimeInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOLocalTimeInterval;
  v5 = [(GEOLocalTimeInterval *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"GEOLocalTimeIntervalStartTimeKey"];
    v5->_startTime = v6;
    [v4 decodeDoubleForKey:@"GEOLocalTimeIntervalEndTimeKey"];
    v5->_endTime = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double startTime = self->_startTime;
  id v5 = a3;
  [v5 encodeDouble:@"GEOLocalTimeIntervalStartTimeKey" forKey:startTime];
  [v5 encodeDouble:@"GEOLocalTimeIntervalEndTimeKey" forKey:self->_endTime];
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

@end