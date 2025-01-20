@interface HMAccessoryLastSeenStatus
- (HMAccessoryLastSeenStatus)initWithLastSeenDate:(id)a3 batteryStatus:(unint64_t)a4;
- (NSDate)lastSeenDate;
- (unint64_t)lowBatteryStatus;
@end

@implementation HMAccessoryLastSeenStatus

- (void).cxx_destruct
{
}

- (unint64_t)lowBatteryStatus
{
  return self->_lowBatteryStatus;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (HMAccessoryLastSeenStatus)initWithLastSeenDate:(id)a3 batteryStatus:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryLastSeenStatus;
  v8 = [(HMAccessoryLastSeenStatus *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastSeenDate, a3);
    v9->_lowBatteryStatus = a4;
  }

  return v9;
}

@end