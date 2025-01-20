@interface AKExponentialDispatchingAlgorithm
- (AKExponentialDispatchingAlgorithm)initWithBase:(double)a3 maxQueueSize:(unint64_t)a4;
- (BOOL)_incrementQueueSize;
- (NSString)debugDescription;
- (double)base;
- (id)nextCalculation;
- (unint64_t)maxQueueSize;
- (void)_decrementQueueSize;
- (void)_incrementCounter;
@end

@implementation AKExponentialDispatchingAlgorithm

- (AKExponentialDispatchingAlgorithm)initWithBase:(double)a3 maxQueueSize:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKExponentialDispatchingAlgorithm;
  result = [(AKExponentialDispatchingAlgorithm *)&v7 init];
  if (result)
  {
    result->_base = a3;
    result->_maxQueueSize = a4;
  }
  return result;
}

- (id)nextCalculation
{
  if ([(AKExponentialDispatchingAlgorithm *)self _incrementQueueSize])
  {
    [(AKExponentialDispatchingAlgorithm *)self _incrementCounter];
    v3 = +[NSDate dateWithTimeIntervalSinceNow:(double)pow(self->_base, (double)self->_counter)];
    objc_initWeak(&location, self);
    unint64_t counter = self->_counter;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002CBFC;
    v7[3] = &unk_100227678;
    objc_copyWeak(&v8, &location);
    v5 = +[AKDispatchingCalculation calculationWithDate:v3 counter:counter algorithm:@"E" relinquisher:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p {\n\tbase: %f,\n\tmaxQueueSize: %lu,\n\t_counter: %lu,\n\t_queueSize: %lu,\n}>", v4, self, *(void *)&self->_base, self->_maxQueueSize, self->_counter, self->_queueSize];

  return (NSString *)v5;
}

- (void)_incrementCounter
{
  unint64_t counter = self->_counter;
  if (counter < self->_maxQueueSize) {
    self->_unint64_t counter = counter + 1;
  }
}

- (BOOL)_incrementQueueSize
{
  unint64_t queueSize = self->_queueSize;
  unint64_t maxQueueSize = self->_maxQueueSize;
  if (queueSize < maxQueueSize) {
    self->_unint64_t queueSize = queueSize + 1;
  }
  return queueSize < maxQueueSize;
}

- (void)_decrementQueueSize
{
  unint64_t queueSize = self->_queueSize;
  if (queueSize) {
    self->_unint64_t queueSize = queueSize - 1;
  }
}

- (double)base
{
  return self->_base;
}

- (unint64_t)maxQueueSize
{
  return self->_maxQueueSize;
}

@end