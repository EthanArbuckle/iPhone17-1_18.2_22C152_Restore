@interface ASCExponentialBackoff
- (ASCExponentialBackoff)initWithBaseSleepTimeInterval:(double)a3 maxSleepTimeInterval:(double)a4;
- (JEUnfairLock)attemptLock;
- (double)baseSleepTimeInterval;
- (double)maxSleepTimeInterval;
- (double)nextSleepTimeInterval;
- (int64_t)attemptsMade;
- (void)reset;
- (void)setAttemptsMade:(int64_t)a3;
@end

@implementation ASCExponentialBackoff

- (ASCExponentialBackoff)initWithBaseSleepTimeInterval:(double)a3 maxSleepTimeInterval:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ASCExponentialBackoff;
  v6 = [(ASCExponentialBackoff *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_baseSleepTimeInterval = a3;
    v6->_maxSleepTimeInterval = a4;
    v8 = (JEUnfairLock *)objc_alloc_init(MEMORY[0x1E4F71960]);
    attemptLock = v7->_attemptLock;
    v7->_attemptLock = v8;

    v7->_attemptsMade = 0;
  }
  return v7;
}

- (double)nextSleepTimeInterval
{
  v3 = [(ASCExponentialBackoff *)self attemptLock];
  [v3 lock];

  double v4 = exp2((double)[(ASCExponentialBackoff *)self attemptsMade]);
  [(ASCExponentialBackoff *)self baseSleepTimeInterval];
  double v6 = v5 * v4;
  [(ASCExponentialBackoff *)self setAttemptsMade:[(ASCExponentialBackoff *)self attemptsMade] + 1];
  v7 = [(ASCExponentialBackoff *)self attemptLock];
  [v7 unlock];

  [(ASCExponentialBackoff *)self maxSleepTimeInterval];
  if (result >= v6) {
    return v6;
  }
  return result;
}

- (void)reset
{
  v3 = [(ASCExponentialBackoff *)self attemptLock];
  [v3 lock];

  [(ASCExponentialBackoff *)self setAttemptsMade:0];
  id v4 = [(ASCExponentialBackoff *)self attemptLock];
  [v4 unlock];
}

- (double)baseSleepTimeInterval
{
  return self->_baseSleepTimeInterval;
}

- (double)maxSleepTimeInterval
{
  return self->_maxSleepTimeInterval;
}

- (JEUnfairLock)attemptLock
{
  return self->_attemptLock;
}

- (int64_t)attemptsMade
{
  return self->_attemptsMade;
}

- (void)setAttemptsMade:(int64_t)a3
{
  self->_attemptsMade = a3;
}

- (void).cxx_destruct
{
}

@end