@interface HMDAudioAnalysisNotificationSentLogEvent
+ (id)shortDescription;
- (HMDAudioAnalysisNotificationSentLogEvent)initWithDate:(id)a3 reason:(unint64_t)a4 state:(unint64_t)a5;
- (NSDate)dateOfOccurrence;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)reason;
- (unint64_t)state;
@end

@implementation HMDAudioAnalysisNotificationSentLogEvent

- (void).cxx_destruct
{
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)dateOfOccurrence
{
  return self->_dateOfOccurrence;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"reason";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationSentLogEvent reason](self, "reason"));
  v7[1] = @"state";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationSentLogEvent state](self, "state"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.audio.analysis.notification.sent.log-event";
}

- (HMDAudioAnalysisNotificationSentLogEvent)initWithDate:(id)a3 reason:(unint64_t)a4 state:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisNotificationSentLogEvent;
  v10 = [(HMMLogEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dateOfOccurrence, a3);
    v11->_reason = a4;
    v11->_state = a5;
  }

  return v11;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end