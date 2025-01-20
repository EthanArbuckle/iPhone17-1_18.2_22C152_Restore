@interface CDResult
- (BOOL)finished;
- (BOOL)isFinished;
- (BOOL)success;
- (BOOL)timedOut;
- (CDResult)init;
- (double)duration;
- (unint64_t)monotonicBegin;
- (unint64_t)monotonicEnd;
- (void)finish;
- (void)setFinished:(BOOL)a3;
- (void)setMonotonicEnd:(unint64_t)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimedOut:(BOOL)a3;
@end

@implementation CDResult

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)finish
{
  [(CDResult *)self setMonotonicEnd:mach_absolute_time()];
  [(CDResult *)self setSuccess:1];
  [(CDResult *)self setFinished:1];
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)setMonotonicEnd:(unint64_t)a3
{
  self->_monotonicEnd = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (CDResult)init
{
  v4.receiver = self;
  v4.super_class = (Class)CDResult;
  v2 = [(CDResult *)&v4 init];
  if (v2) {
    v2->_monotonicBegin = mach_absolute_time();
  }
  return v2;
}

- (unint64_t)monotonicEnd
{
  return self->_monotonicEnd;
}

- (unint64_t)monotonicBegin
{
  return self->_monotonicBegin;
}

- (double)duration
{
  if (![(CDResult *)self finished]) {
    return INFINITY;
  }
  unint64_t v3 = [(CDResult *)self monotonicBegin];
  unint64_t v4 = [(CDResult *)self monotonicEnd];
  if (_MergedGlobals_12 != -1) {
    dispatch_once(&_MergedGlobals_12, &__block_literal_global_2);
  }
  return (double)((v4 - v3) * dword_10006A828 / *(unsigned int *)algn_10006A82C) / 1000000000.0;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

@end