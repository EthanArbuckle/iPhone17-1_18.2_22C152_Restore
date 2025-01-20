@interface HMDAccessCodeSetupLogEvent
- (BOOL)success;
- (HMDAccessCodeSetupLogEvent)init;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)failureReason;
- (void)submitFailureWithReason:(unint64_t)a3 error:(id)a4;
- (void)submitSuccess;
@end

@implementation HMDAccessCodeSetupLogEvent

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (BOOL)success
{
  return self->_success;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessCodeSetupLogEvent success](self, "success"));
  [v3 setObject:v5 forKeyedSubscript:@"success"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessCodeSetupLogEvent failureReason](self, "failureReason"));
  [v3 setObject:v6 forKeyedSubscript:@"failureReason"];

  v7 = (void *)[v3 copy];
  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.accesscode.setup";
}

- (void)submitSuccess
{
  self->_failureReason = 0;
  self->_success = 1;
  id v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v3 submitLogEvent:self];
}

- (void)submitFailureWithReason:(unint64_t)a3 error:(id)a4
{
  self->_failureReason = a3;
  self->_success = 0;
  id v5 = a4;
  id v6 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v6 submitLogEvent:self error:v5];
}

- (HMDAccessCodeSetupLogEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDAccessCodeSetupLogEvent;
  return [(HMMLogEvent *)&v3 init];
}

@end