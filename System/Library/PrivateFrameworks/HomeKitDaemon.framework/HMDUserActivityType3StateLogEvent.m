@interface HMDUserActivityType3StateLogEvent
- (BOOL)didEnterTransition;
- (BOOL)didEnterType5;
- (HMDUserActivityType3StateLogEvent)initWithState:(unint64_t)a3 oldState:(unint64_t)a4 logReason:(unint64_t)a5;
- (unint64_t)logReason;
- (unint64_t)oldState;
- (unint64_t)state;
@end

@implementation HMDUserActivityType3StateLogEvent

- (unint64_t)logReason
{
  return self->_logReason;
}

- (unint64_t)oldState
{
  return self->_oldState;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)didEnterType5
{
  unint64_t v3 = [(HMDUserActivityType3StateLogEvent *)self state];
  return v3 != [(HMDUserActivityType3StateLogEvent *)self oldState]
      && [(HMDUserActivityType3StateLogEvent *)self state] == 5;
}

- (BOOL)didEnterTransition
{
  return [(HMDUserActivityType3StateLogEvent *)self state] - 3 <= 1
      && [(HMDUserActivityType3StateLogEvent *)self oldState] - 5 < 0xFFFFFFFFFFFFFFFELL;
}

- (HMDUserActivityType3StateLogEvent)initWithState:(unint64_t)a3 oldState:(unint64_t)a4 logReason:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityType3StateLogEvent;
  result = [(HMMLogEvent *)&v9 init];
  if (result)
  {
    result->_state = a3;
    result->_oldState = a4;
    result->_logReason = a5;
  }
  return result;
}

@end