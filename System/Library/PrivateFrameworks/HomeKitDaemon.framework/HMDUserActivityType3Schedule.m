@interface HMDUserActivityType3Schedule
- (BMStoreEvent)biomeEvent;
- (HMDUserActivityType3Schedule)initWithState:(unint64_t)a3 stateChangedReason:(unint64_t)a4 stateChangedTime:(id)a5;
- (NSDate)stateChangedTime;
- (unint64_t)state;
- (unint64_t)stateChangedReason;
- (void)setBiomeEvent:(id)a3;
@end

@implementation HMDUserActivityType3Schedule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeEvent, 0);
  objc_storeStrong((id *)&self->_stateChangedTime, 0);
}

- (void)setBiomeEvent:(id)a3
{
}

- (BMStoreEvent)biomeEvent
{
  return self->_biomeEvent;
}

- (NSDate)stateChangedTime
{
  return self->_stateChangedTime;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)stateChangedReason
{
  return self->_stateChangedReason;
}

- (HMDUserActivityType3Schedule)initWithState:(unint64_t)a3 stateChangedReason:(unint64_t)a4 stateChangedTime:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserActivityType3Schedule;
  v10 = [(HMDUserActivityType3Schedule *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    v10->_stateChangedReason = a4;
    objc_storeStrong((id *)&v10->_stateChangedTime, a5);
  }

  return v11;
}

@end