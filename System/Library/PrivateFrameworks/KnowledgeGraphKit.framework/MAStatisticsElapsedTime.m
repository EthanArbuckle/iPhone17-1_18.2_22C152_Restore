@interface MAStatisticsElapsedTime
- (BOOL)isTransactionPending;
- (MAStatisticsElapsedTime)init;
- (double)elapsedTime;
- (double)elapsedTimeSinceLastBeginTransaction;
- (double)elapsedTimeSinceLastEndTransaction;
- (void)begin;
- (void)dealloc;
- (void)end;
@end

@implementation MAStatisticsElapsedTime

- (BOOL)isTransactionPending
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_elapsedCounter > 0;
  objc_sync_exit(v2);

  return v3;
}

- (double)elapsedTimeSinceLastEndTransaction
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = 0.0;
  if (v2->_lastEndTransactionTime != 0.0) {
    double v3 = CFAbsoluteTimeGetCurrent() - v2->_lastEndTransactionTime;
  }
  objc_sync_exit(v2);

  return v3;
}

- (double)elapsedTimeSinceLastBeginTransaction
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = 0.0;
  if (v2->_lastBeginTransactionTime != 0.0) {
    double v3 = CFAbsoluteTimeGetCurrent() - v2->_lastBeginTransactionTime;
  }
  objc_sync_exit(v2);

  return v3;
}

- (double)elapsedTime
{
  v2 = self;
  objc_sync_enter(v2);
  double elapsedTime = v2->_elapsedTime;
  if (v2->_elapsedCounter >= 1) {
    double elapsedTime = elapsedTime + CFAbsoluteTimeGetCurrent() - v2->_elapsedStart;
  }
  objc_sync_exit(v2);

  return elapsedTime;
}

- (void)end
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  uint64_t v3 = obj->_elapsedCounter - 1;
  obj->_elapsedCounter = v3;
  if (!v3)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v2 = obj;
    obj->_lastEndTransactionTime = Current;
    obj->_double elapsedTime = obj->_elapsedTime + Current - obj->_elapsedStart;
    obj->_elapsedStart = 0.0;
  }
  objc_sync_exit(v2);
}

- (void)begin
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  int64_t elapsedCounter = obj->_elapsedCounter;
  if (!elapsedCounter)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v2 = obj;
    obj->_lastBeginTransactionTime = Current;
    obj->_elapsedStart = Current;
    int64_t elapsedCounter = obj->_elapsedCounter;
  }
  v2->_int64_t elapsedCounter = elapsedCounter + 1;
  objc_sync_exit(v2);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MAStatisticsElapsedTime;
  [(MAStatisticsElapsedTime *)&v2 dealloc];
}

- (MAStatisticsElapsedTime)init
{
  v3.receiver = self;
  v3.super_class = (Class)MAStatisticsElapsedTime;
  result = [(MAStatisticsElapsedTime *)&v3 init];
  if (result)
  {
    result->_lastEndTransactionTime = 0.0;
    *(_OWORD *)&result->_int64_t elapsedCounter = 0u;
    *(_OWORD *)&result->_double elapsedTime = 0u;
  }
  return result;
}

@end