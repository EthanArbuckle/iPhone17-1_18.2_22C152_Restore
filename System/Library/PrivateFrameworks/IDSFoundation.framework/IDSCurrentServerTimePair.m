@interface IDSCurrentServerTimePair
- (BOOL)isAccurate;
- (IDSCurrentServerTimePair)initWithInitialProcessMonotonicTimeInNanoSeconds:(unint64_t)a3 initialServerTimeInNanoSeconds:(unint64_t)a4 isAccurate:(BOOL)a5;
- (unint64_t)initialProcessMonotonicTimeInNanoSeconds;
- (unint64_t)initialServerTimeInNanoSeconds;
@end

@implementation IDSCurrentServerTimePair

- (IDSCurrentServerTimePair)initWithInitialProcessMonotonicTimeInNanoSeconds:(unint64_t)a3 initialServerTimeInNanoSeconds:(unint64_t)a4 isAccurate:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IDSCurrentServerTimePair;
  result = [(IDSCurrentServerTimePair *)&v9 init];
  if (result)
  {
    result->_initialProcessMonotonicTimeInNanoSeconds = a3;
    result->_initialServerTimeInNanoSeconds = a4;
    result->_isAccurate = a5;
  }
  return result;
}

- (unint64_t)initialProcessMonotonicTimeInNanoSeconds
{
  return self->_initialProcessMonotonicTimeInNanoSeconds;
}

- (unint64_t)initialServerTimeInNanoSeconds
{
  return self->_initialServerTimeInNanoSeconds;
}

- (BOOL)isAccurate
{
  return self->_isAccurate;
}

@end