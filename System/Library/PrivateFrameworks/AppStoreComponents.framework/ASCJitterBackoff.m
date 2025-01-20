@interface ASCJitterBackoff
- (ASCExponentialBackoff)exponentialBackoff;
- (ASCJitterBackoff)initWithBaseSleepTimeInterval:(double)a3 maxSleepTimeInterval:(double)a4;
- (double)nextSleepTimeInterval;
- (void)reset;
@end

@implementation ASCJitterBackoff

- (ASCJitterBackoff)initWithBaseSleepTimeInterval:(double)a3 maxSleepTimeInterval:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ASCJitterBackoff;
  v6 = [(ASCJitterBackoff *)&v10 init];
  if (v6)
  {
    v7 = [[ASCExponentialBackoff alloc] initWithBaseSleepTimeInterval:a3 maxSleepTimeInterval:a4];
    exponentialBackoff = v6->_exponentialBackoff;
    v6->_exponentialBackoff = v7;
  }
  return v6;
}

- (double)nextSleepTimeInterval
{
  double v3 = (double)arc4random() / 4294967300.0;
  v4 = [(ASCJitterBackoff *)self exponentialBackoff];
  [v4 nextSleepTimeInterval];
  double v6 = v3 * v5;

  return v6;
}

- (void)reset
{
  id v2 = [(ASCJitterBackoff *)self exponentialBackoff];
  [v2 reset];
}

- (ASCExponentialBackoff)exponentialBackoff
{
  return self->_exponentialBackoff;
}

- (void).cxx_destruct
{
}

@end