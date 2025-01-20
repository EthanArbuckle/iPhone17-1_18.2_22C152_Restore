@interface HMDHomeKeySetupWalletLogEvent
- (BOOL)success;
- (HMDHomeKeySetupWalletLogEvent)initWithQueue:(id)a3;
- (HMFTimer)timer;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setTimer:(id)a3;
- (void)submitSuccess;
- (void)timeout;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDHomeKeySetupWalletLogEvent

- (void).cxx_destruct
{
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (BOOL)success
{
  return self->_success;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeKeySetupWalletLogEvent *)self timer];

  if (v5 == v4)
  {
    [(HMDHomeKeySetupWalletLogEvent *)self timeout];
  }
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeKeySetupWalletLogEvent success](self, "success"));
  [v3 setObject:v5 forKeyedSubscript:@"success"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.homekey.wallet.setup";
}

- (void)timeout
{
  self->_success = 0;
  id v4 = +[HMDMetricsManager sharedLogEventSubmitter];
  v3 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
  [v4 submitLogEvent:self error:v3];
}

- (void)submitSuccess
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_timeout object:0];
  self->_success = 1;
  id v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v3 submitLogEvent:self];
}

- (HMDHomeKeySetupWalletLogEvent)initWithQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeKeySetupWalletLogEvent;
  id v3 = a3;
  id v4 = [(HMMLogEvent *)&v9 init];
  id v5 = objc_alloc(MEMORY[0x1E4F65580]);
  uint64_t v6 = objc_msgSend(v5, "initWithTimeInterval:options:", 0, 60.0, v9.receiver, v9.super_class);
  timer = v4->_timer;
  v4->_timer = (HMFTimer *)v6;

  [(HMFTimer *)v4->_timer setDelegate:v4];
  [(HMFTimer *)v4->_timer setDelegateQueue:v3];

  return v4;
}

@end