@interface MDLAnimatedValue
- (BOOL)isAnimated;
- (MDLAnimatedValue)init;
- (MDLAnimatedValueInterpolation)interpolation;
- (MDLDataPrecision)precision;
- (NSArray)keyTimes;
- (NSTimeInterval)maximumTime;
- (NSTimeInterval)minimumTime;
- (NSUInteger)getTimes:(NSTimeInterval *)timesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)timeSampleCount;
- (VtValue)defaultVtValue;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (void)clear;
- (void)resetWithAnimatedValue:(id)a3;
- (void)setInterpolation:(MDLAnimatedValueInterpolation)interpolation;
@end

@implementation MDLAnimatedValue

- (MDLAnimatedValue)init
{
  v5.receiver = self;
  v5.super_class = (Class)MDLAnimatedValue;
  v2 = [(MDLAnimatedValue *)&v5 init];
  if (v2)
  {
    sub_20B1A804C();
    v2->_interpolation = 1;
    v3 = v2;
  }

  return v2;
}

- (void)resetWithAnimatedValue:(id)a3
{
  id v4 = a3;
  sub_20B15F584((uint64_t **)&self->_timeSampledData, (uint64_t **)v4 + 1);
  self->_interpolation = *((void *)v4 + 4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  *(void *)(v10 + 32) = self->_interpolation;
  sub_20B15F584((uint64_t **)(v10 + 8), (uint64_t **)&self->_timeSampledData);
  return (id)v10;
}

- (MDLDataPrecision)precision
{
  return 0;
}

- (VtValue)defaultVtValue
{
  *(void *)(v2 + 8) = 0;
  result._info._ptrAndBits = (_TypeInfo *)a2;
  result._storage = (type)self;
  return result;
}

- (NSUInteger)timeSampleCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - self->_timeSampledData.__begin_) >> 3);
}

- (NSTimeInterval)minimumTime
{
  begin = self->_timeSampledData.__begin_;
  end = self->_timeSampledData.__end_;
  if (end == begin) {
    return 0.0;
  }
  NSTimeInterval result = 1000000000.0;
  do
  {
    double v5 = *(double *)begin;
    begin = (TimeSampledVtValue *)((char *)begin + 24);
    double v6 = v5;
    if (v5 < result) {
      NSTimeInterval result = v6;
    }
  }
  while (begin != end);
  return result;
}

- (NSTimeInterval)maximumTime
{
  begin = self->_timeSampledData.__begin_;
  end = self->_timeSampledData.__end_;
  if (end == begin) {
    return 0.0;
  }
  NSTimeInterval result = -1000000000.0;
  do
  {
    double v5 = *(double *)begin;
    begin = (TimeSampledVtValue *)((char *)begin + 24);
    double v6 = v5;
    if (v5 > result) {
      NSTimeInterval result = v6;
    }
  }
  while (begin != end);
  return result;
}

- (void)clear
{
  begin = self->_timeSampledData.__begin_;
  end = self->_timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      double v5 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v5;
    }
    while (v5 != begin);
  }
  self->_timeSampledData.__end_ = begin;
}

- (NSArray)keyTimes
{
  v3 = objc_opt_new();
  if (self->_timeSampledData.__end_ != self->_timeSampledData.__begin_)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      id v6 = objc_alloc(NSNumber);
      uint64_t v9 = objc_msgSend_initWithDouble_(v6, v7, v8, *(double *)((char *)self->_timeSampledData.__begin_ + v4));
      objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

      ++v5;
      v4 += 24;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - self->_timeSampledData.__begin_) >> 3));
  }

  return (NSArray *)v3;
}

- (NSUInteger)getTimes:(NSTimeInterval *)timesArray maxCount:(NSUInteger)maxCount
{
  begin = self->_timeSampledData.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - begin) >> 3) >= maxCount) {
    NSUInteger result = maxCount;
  }
  else {
    NSUInteger result = 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - begin) >> 3);
  }
  if (result)
  {
    NSUInteger v6 = result;
    do
    {
      uint64_t v7 = *(void *)begin;
      begin = (TimeSampledVtValue *)((char *)begin + 24);
      *(void *)timesArray++ = v7;
      --v6;
    }
    while (v6);
  }
  return result;
}

- (BOOL)isAnimated
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - self->_timeSampledData.__begin_) >> 3) > 1;
}

- (MDLAnimatedValueInterpolation)interpolation
{
  return self->_interpolation;
}

- (void)setInterpolation:(MDLAnimatedValueInterpolation)interpolation
{
  self->_interpolation = interpolation;
}

- (void).cxx_destruct
{
  begin = self->_timeSampledData.__begin_;
  if (begin)
  {
    end = self->_timeSampledData.__end_;
    unint64_t v5 = self->_timeSampledData.__begin_;
    if (end != begin)
    {
      do
      {
        NSUInteger v6 = (TimeSampledVtValue *)((char *)end - 24);
        sub_20B06A698((uint64_t)end - 16);
        end = v6;
      }
      while (v6 != begin);
      unint64_t v5 = self->_timeSampledData.__begin_;
    }
    self->_timeSampledData.__end_ = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end