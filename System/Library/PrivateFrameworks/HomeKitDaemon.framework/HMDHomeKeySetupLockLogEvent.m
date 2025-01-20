@interface HMDHomeKeySetupLockLogEvent
- (BOOL)incrementCompleted;
- (BOOL)success;
- (HMDHomeKeySetupLockLogEvent)initWithAccessoryUUID:(id)a3 withKeyType:(unint64_t)a4 expectedCount:(int64_t)a5 queue:(id)a6;
- (HMFTimer)timer;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSUUID)accessoryUUID;
- (int64_t)completedCount;
- (int64_t)expectedCount;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)keyType;
- (void)setCompletedCount:(int64_t)a3;
- (void)setExpectedCount:(int64_t)a3;
- (void)setTimer:(id)a3;
- (void)submitSuccess;
- (void)timeout;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDHomeKeySetupLockLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setCompletedCount:(int64_t)a3
{
  self->_completedCount = a3;
}

- (int64_t)completedCount
{
  return self->_completedCount;
}

- (void)setExpectedCount:(int64_t)a3
{
  self->_expectedCount = a3;
}

- (int64_t)expectedCount
{
  return self->_expectedCount;
}

- (unint64_t)keyType
{
  return self->_keyType;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)success
{
  return self->_success;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeKeySetupLockLogEvent *)self timer];

  if (v5 == v4)
  {
    [(HMDHomeKeySetupLockLogEvent *)self timeout];
  }
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeKeySetupLockLogEvent success](self, "success"));
  [v3 setObject:v5 forKeyedSubscript:@"success"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeKeySetupLockLogEvent expectedCount](self, "expectedCount"));
  [v3 setObject:v6 forKeyedSubscript:@"expectedCount"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeKeySetupLockLogEvent completedCount](self, "completedCount"));
  [v3 setObject:v7 forKeyedSubscript:@"completedCount"];

  v8 = (void *)[v3 copy];
  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.homekey.lock.setup";
}

- (void)timeout
{
  self->_success = 0;
  id v4 = +[HMDMetricsManager sharedLogEventSubmitter];
  v3 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
  [v4 submitLogEvent:self error:v3];
}

- (void)submitSuccess
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_timeout object:0];
  self->_success = 1;
  id v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v3 submitLogEvent:self];
}

- (BOOL)incrementCompleted
{
  [(HMDHomeKeySetupLockLogEvent *)self setCompletedCount:[(HMDHomeKeySetupLockLogEvent *)self completedCount] + 1];
  int64_t v3 = [(HMDHomeKeySetupLockLogEvent *)self completedCount];
  int64_t v4 = [(HMDHomeKeySetupLockLogEvent *)self expectedCount];
  if (v3 == v4) {
    [(HMDHomeKeySetupLockLogEvent *)self submitSuccess];
  }
  return v3 == v4;
}

- (HMDHomeKeySetupLockLogEvent)initWithAccessoryUUID:(id)a3 withKeyType:(unint64_t)a4 expectedCount:(int64_t)a5 queue:(id)a6
{
  v10 = (NSUUID *)a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDHomeKeySetupLockLogEvent;
  id v11 = a6;
  v12 = [(HMMLogEvent *)&v19 init];
  accessoryUUID = v12->_accessoryUUID;
  v12->_accessoryUUID = v10;
  v14 = v10;

  v12->_keyType = a4;
  v12->_expectedCount = a5;
  v12->_completedCount = 0;
  id v15 = objc_alloc(MEMORY[0x263F42658]);
  uint64_t v16 = objc_msgSend(v15, "initWithTimeInterval:options:", 0, 60.0, v19.receiver, v19.super_class);
  timer = v12->_timer;
  v12->_timer = (HMFTimer *)v16;

  [(HMFTimer *)v12->_timer setDelegate:v12];
  [(HMFTimer *)v12->_timer setDelegateQueue:v11];

  return v12;
}

@end