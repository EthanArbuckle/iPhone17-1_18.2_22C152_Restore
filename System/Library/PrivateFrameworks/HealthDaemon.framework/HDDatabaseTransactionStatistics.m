@interface HDDatabaseTransactionStatistics
- (double)duration;
- (double)endTime;
- (double)startTime;
- (id)_initWithStartTime:(double)a3 endTime:(double)a4;
@end

@implementation HDDatabaseTransactionStatistics

- (id)_initWithStartTime:(double)a3 endTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HDDatabaseTransactionStatistics;
  id result = [(HDDatabaseTransactionStatistics *)&v7 init];
  if (result)
  {
    *((double *)result + 1) = a3;
    *((double *)result + 2) = a4;
  }
  return result;
}

- (double)duration
{
  return self->_endTime - self->_startTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

@end