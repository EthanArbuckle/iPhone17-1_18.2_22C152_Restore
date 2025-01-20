@interface HMITimeIntervalAverage
- (HMITimeIntervalAverage)initWithMaxCapacity:(int64_t)a3;
- (double)value;
- (double)valueForInterval:(double)a3 defaultValue:(double)a4;
- (void)addValue:(double)a3;
@end

@implementation HMITimeIntervalAverage

- (HMITimeIntervalAverage)initWithMaxCapacity:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMITimeIntervalAverage;
  v4 = [(HMITimeIntervalAverage *)&v8 init];
  if (v4)
  {
    v5 = [[MovingAverage alloc] initWithWindowSize:a3];
    average = v4->_average;
    v4->_average = v5;
  }
  return v4;
}

- (void)addValue:(double)a3
{
  average = self->_average;
  id v4 = [NSNumber numberWithDouble:a3];
  [(MovingAverage *)average addNumber:v4];
}

- (double)value
{
  [(MovingAverage *)self->_average movingAverage];
  return result;
}

- (double)valueForInterval:(double)a3 defaultValue:(double)a4
{
  [(MovingAverage *)self->_average movingAverageForInterval:a3 defaultValue:a4];
  return result;
}

- (void).cxx_destruct
{
}

@end