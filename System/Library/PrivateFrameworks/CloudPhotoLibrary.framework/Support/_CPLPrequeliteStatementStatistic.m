@interface _CPLPrequeliteStatementStatistic
- (NSString)statement;
- (_CPLPrequeliteStatementStatistic)initWithStatement:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)count;
- (unint64_t)durationInNanoSeconds;
- (unint64_t)resultsCount;
- (void)setCount:(unint64_t)a3;
- (void)setDurationInNanoSeconds:(unint64_t)a3;
- (void)setResultsCount:(unint64_t)a3;
@end

@implementation _CPLPrequeliteStatementStatistic

- (_CPLPrequeliteStatementStatistic)initWithStatement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CPLPrequeliteStatementStatistic;
  v5 = [(_CPLPrequeliteStatementStatistic *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    statement = v5->_statement;
    v5->_statement = v6;
  }
  return v5;
}

- (int64_t)compare:(id)a3
{
  unint64_t durationInNanoSeconds = self->_durationInNanoSeconds;
  unint64_t v4 = *((void *)a3 + 4);
  BOOL v5 = durationInNanoSeconds > v4;
  int64_t v6 = durationInNanoSeconds != v4;
  if (v5) {
    return -1;
  }
  else {
    return v6;
  }
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%lu * %@", self->_count, self->_statement];
  unint64_t v4 = v3;
  unint64_t resultsCount = self->_resultsCount;
  unint64_t durationInNanoSeconds = self->_durationInNanoSeconds;
  if (durationInNanoSeconds)
  {
    double v7 = (double)durationInNanoSeconds * 0.000001;
    if (resultsCount) {
      objc_msgSend(v3, "appendFormat:", @" (%lu results - %0.0fms)", resultsCount, *(void *)&v7);
    }
    else {
      objc_msgSend(v3, "appendFormat:", @" (%0.0fms)", *(void *)&v7, v9);
    }
  }
  else if (resultsCount)
  {
    objc_msgSend(v3, "appendFormat:", @" (%lu results)", self->_resultsCount, v9);
  }
  return v4;
}

- (NSString)statement
{
  return self->_statement;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)resultsCount
{
  return self->_resultsCount;
}

- (void)setResultsCount:(unint64_t)a3
{
  self->_unint64_t resultsCount = a3;
}

- (unint64_t)durationInNanoSeconds
{
  return self->_durationInNanoSeconds;
}

- (void)setDurationInNanoSeconds:(unint64_t)a3
{
  self->_unint64_t durationInNanoSeconds = a3;
}

- (void).cxx_destruct
{
}

@end