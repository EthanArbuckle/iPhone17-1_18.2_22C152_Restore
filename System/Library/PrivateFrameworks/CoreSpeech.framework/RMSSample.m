@interface RMSSample
- (RMSSample)initWithRMSScore:(double)a3 lastSampleCount:(unint64_t)a4;
- (double)RMSScore;
- (int64_t)compareScoresDesc:(id)a3;
- (unint64_t)lastSampleCount;
- (void)setLastSampleCount:(unint64_t)a3;
- (void)setRMSScore:(double)a3;
@end

@implementation RMSSample

- (void)setLastSampleCount:(unint64_t)a3
{
  self->_lastSampleCount = a3;
}

- (unint64_t)lastSampleCount
{
  return self->_lastSampleCount;
}

- (void)setRMSScore:(double)a3
{
  self->_RMSScore = a3;
}

- (double)RMSScore
{
  return self->_RMSScore;
}

- (int64_t)compareScoresDesc:(id)a3
{
  id v4 = a3;
  [(RMSSample *)self RMSScore];
  double v6 = v5;
  [v4 RMSScore];
  double v8 = v7;

  return v6 < v8;
}

- (RMSSample)initWithRMSScore:(double)a3 lastSampleCount:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RMSSample;
  result = [(RMSSample *)&v7 init];
  if (result)
  {
    result->_RMSScore = a3;
    result->_lastSampleCount = a4;
  }
  return result;
}

@end