@interface HMDUserActivityStateType6DetectorTransitionLogEvent
- (HMDUserActivityStateType6DetectorTransitionLogEvent)initWithTrackerType:(unint64_t)a3 reason:(unint64_t)a4;
- (HMDUserActivityStateType6DetectorTransitionLogEvent)initWithTrackerType:(unint64_t)a3 reason:(unint64_t)a4 stateEndOffset:(int64_t)a5;
- (NSString)eventString;
- (int64_t)stateEndOffset;
- (unint64_t)reason;
- (unint64_t)trackerType;
@end

@implementation HMDUserActivityStateType6DetectorTransitionLogEvent

- (void).cxx_destruct
{
}

- (NSString)eventString
{
  return self->_eventString;
}

- (int64_t)stateEndOffset
{
  return self->_stateEndOffset;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)trackerType
{
  return self->_trackerType;
}

- (HMDUserActivityStateType6DetectorTransitionLogEvent)initWithTrackerType:(unint64_t)a3 reason:(unint64_t)a4 stateEndOffset:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)HMDUserActivityStateType6DetectorTransitionLogEvent;
  v8 = [(HMMLogEvent *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_trackerType = a3;
    v8->_reason = a4;
    v8->_stateEndOffset = a5;
    v10 = @"Unknown";
    if (a3 == 2) {
      v10 = @"CoreLocation";
    }
    if (a3 == 1) {
      v10 = @"None";
    }
    if (a4 - 1 > 9) {
      v11 = @"Other";
    }
    else {
      v11 = off_264A182B8[a4 - 1];
    }
    uint64_t v12 = [NSString stringWithFormat:@"%@-%@", v10, v11];
    eventString = v9->_eventString;
    v9->_eventString = (NSString *)v12;
  }
  return v9;
}

- (HMDUserActivityStateType6DetectorTransitionLogEvent)initWithTrackerType:(unint64_t)a3 reason:(unint64_t)a4
{
  return [(HMDUserActivityStateType6DetectorTransitionLogEvent *)self initWithTrackerType:a3 reason:a4 stateEndOffset:0];
}

@end