@interface AVFrameRateRange
+ (AVFrameRateRange)frameRateRangeWithMinRate:(int)a3 maxFrameRate:(int)a4;
+ (void)initialize;
- (AVFrameRateRange)initWithMinFrameRate:(int)a3 maxFrameRate:(int)a4;
- (BOOL)includesFrameDuration:(id *)a3;
- (BOOL)includesFrameRate:(double)a3;
- (BOOL)isEqual:(id)a3;
- (CMTime)maxFrameDuration;
- (CMTime)minFrameDuration;
- (Float64)maxFrameRate;
- (Float64)minFrameRate;
- (id)description;
- (void)dealloc;
@end

@implementation AVFrameRateRange

- (CMTime)minFrameDuration
{
  return CMTimeMake(retstr, 1, self->_internal->maxFrameRate);
}

- (Float64)maxFrameRate
{
  return (double)self->_internal->maxFrameRate;
}

- (Float64)minFrameRate
{
  return (double)self->_internal->minFrameRate;
}

+ (AVFrameRateRange)frameRateRangeWithMinRate:(int)a3 maxFrameRate:(int)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMinFrameRate:*(void *)&a3 maxFrameRate:*(void *)&a4];

  return (AVFrameRateRange *)v4;
}

- (AVFrameRateRange)initWithMinFrameRate:(int)a3 maxFrameRate:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVFrameRateRange;
  v6 = [(AVFrameRateRange *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVFrameRateRangeInternal);
    v6->_internal = v7;
    if (v7)
    {
      v7->minFrameRate = a3;
      v6->_internal->maxFrameRate = a4;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  uint64_t v13 = v3;
  uint64_t v14 = v4;
  int v7 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v7) {
    return v7;
  }
  if (a3)
  {
    [a3 maxFrameDuration];
    if (self)
    {
LABEL_5:
      [(AVFrameRateRange *)self maxFrameDuration];
      goto LABEL_9;
    }
  }
  else
  {
    memset(&v12, 0, sizeof(v12));
    if (self) {
      goto LABEL_5;
    }
  }
  memset(&time2, 0, sizeof(time2));
LABEL_9:
  if (CMTimeCompare(&v12, &time2))
  {
LABEL_16:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (!a3)
  {
    memset(&time1, 0, sizeof(time1));
    if (self) {
      goto LABEL_12;
    }
LABEL_14:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_15;
  }
  [a3 minFrameDuration];
  if (!self) {
    goto LABEL_14;
  }
LABEL_12:
  [(AVFrameRateRange *)self minFrameDuration];
LABEL_15:
  if (CMTimeCompare(&time1, &v9)) {
    goto LABEL_16;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (CMTime)maxFrameDuration
{
  return CMTimeMake(retstr, 1, self->_internal->minFrameRate);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFrameRateRange;
  [(AVFrameRateRange *)&v3 dealloc];
}

+ (void)initialize
{
}

- (BOOL)includesFrameRate:(double)a3
{
  internal = self->_internal;
  return (double)internal->maxFrameRate >= a3 && (double)internal->minFrameRate <= a3;
}

- (BOOL)includesFrameDuration:(id *)a3
{
  return [(AVFrameRateRange *)self includesFrameRate:(double)a3->var1 / (double)a3->var0];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %d - %d>", NSStringFromClass(v4), self, self->_internal->minFrameRate, self->_internal->maxFrameRate];
}

@end