@interface HMDUserActivityType6StateEvent
- (HMDUserActivityType6StateEvent)initWithState:(unint64_t)a3 stateEnd:(id)a4 changedTimestamp:(id)a5 withReason:(unint64_t)a6;
- (NSDate)changedTimestamp;
- (NSDate)stateEnd;
- (unint64_t)reason;
- (unint64_t)state;
@end

@implementation HMDUserActivityType6StateEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedTimestamp, 0);
  objc_storeStrong((id *)&self->_stateEnd, 0);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)changedTimestamp
{
  return self->_changedTimestamp;
}

- (NSDate)stateEnd
{
  return self->_stateEnd;
}

- (unint64_t)state
{
  return self->_state;
}

- (HMDUserActivityType6StateEvent)initWithState:(unint64_t)a3 stateEnd:(id)a4 changedTimestamp:(id)a5 withReason:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDUserActivityType6StateEvent;
  v13 = [(HMDUserActivityType6StateEvent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_state = a3;
    objc_storeStrong((id *)&v13->_stateEnd, a4);
    objc_storeStrong((id *)&v14->_changedTimestamp, a5);
    v14->_reason = a6;
  }

  return v14;
}

@end