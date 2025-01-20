@interface HMDAudioAnalysisNotificationReceivedLogEvent
- (HMDAudioAnalysisNotificationReceivedLogEvent)initWithReason:(unint64_t)a3 state:(unint64_t)a4 notificationSentDate:(id)a5;
- (NSDate)endDate;
- (NSDate)notificationSentDate;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (double)latency;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)reason;
- (unint64_t)state;
- (void)markEndTime;
@end

@implementation HMDAudioAnalysisNotificationReceivedLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSentDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (NSDate)notificationSentDate
{
  return self->_notificationSentDate;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"latency";
  v3 = NSNumber;
  [(HMDAudioAnalysisNotificationReceivedLogEvent *)self latency];
  v5 = [v3 numberWithInteger:(uint64_t)(v4 * 1000.0)];
  v11[0] = v5;
  v10[1] = @"reason";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationReceivedLogEvent reason](self, "reason"));
  v11[1] = v6;
  v10[2] = @"state";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationReceivedLogEvent state](self, "state"));
  v11[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.audio.analysis.notification.received.log-event";
}

- (double)latency
{
  if (![(HMMLogEvent *)self isSubmitted]) {
    return 0.0;
  }
  v3 = [(HMDAudioAnalysisNotificationReceivedLogEvent *)self endDate];
  double v4 = [(HMDAudioAnalysisNotificationReceivedLogEvent *)self notificationSentDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (NSDate)endDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)markEndTime
{
  v5.receiver = self;
  v5.super_class = (Class)HMDAudioAnalysisNotificationReceivedLogEvent;
  [(HMMLogEvent *)&v5 markEndTime];
  os_unfair_lock_lock_with_options();
  if (!self->_endDate)
  {
    v3 = [MEMORY[0x263EFF910] date];
    endDate = self->_endDate;
    self->_endDate = v3;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAudioAnalysisNotificationReceivedLogEvent)initWithReason:(unint64_t)a3 state:(unint64_t)a4 notificationSentDate:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisNotificationReceivedLogEvent;
  v10 = [(HMMLogEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_state = a4;
    v10->_reason = a3;
    objc_storeStrong((id *)&v10->_notificationSentDate, a5);
  }

  return v11;
}

@end