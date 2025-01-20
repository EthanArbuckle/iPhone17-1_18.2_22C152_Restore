@interface HMDHomePodSensorPairingLogEvent
- (BOOL)pairingSuccess;
- (HMDHomePodSensorPairingLogEvent)initWithStartTime:(double)a3 pairingSuccess:(BOOL)a4 failureReason:(unint64_t)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)failureReason;
@end

@implementation HMDHomePodSensorPairingLogEvent

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (BOOL)pairingSuccess
{
  return self->_pairingSuccess;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(HMMLogEvent *)self startTime];
  if (v4 != 0.0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
    [v3 setObject:v5 forKeyedSubscript:@"duration"];
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSensorPairingLogEvent pairingSuccess](self, "pairingSuccess"));
  [v3 setObject:v6 forKeyedSubscript:@"success"];

  v7 = [(HMMLogEvent *)self error];
  v8 = [v7 domain];
  [v3 setObject:v8 forKeyedSubscript:@"errorDomain"];

  v9 = NSNumber;
  v10 = [(HMMLogEvent *)self error];
  v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "code"));
  [v3 setObject:v11 forKeyedSubscript:@"errorNumber"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomePodSensorPairingLogEvent failureReason](self, "failureReason"));
  [v3 setObject:v12 forKeyedSubscript:@"failureReason"];

  v13 = (void *)[v3 copy];
  return (NSDictionary *)v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.homepod.sensor.pairing";
}

- (HMDHomePodSensorPairingLogEvent)initWithStartTime:(double)a3 pairingSuccess:(BOOL)a4 failureReason:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HMDHomePodSensorPairingLogEvent;
  result = [(HMMLogEvent *)&v8 initWithStartTime:a3];
  if (result)
  {
    result->_pairingSuccess = a4;
    result->_failureReason = a5;
  }
  return result;
}

@end