@interface HMDDoorbellChimeNotificationLogEvent
- (BOOL)coordinationPathTriggered;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSError)coordinationError;
- (NSString)coreAnalyticsEventName;
- (int64_t)coordinationLatency;
- (unint64_t)coordinationMode;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)coreUtilsDestinationCount;
- (unint64_t)coreUtilsLatency;
- (unint64_t)numHomePodsWithDoorbellChimeEnabled;
- (void)setCoordinationError:(id)a3;
- (void)setCoordinationLatency:(int64_t)a3;
- (void)setCoordinationMode:(unint64_t)a3;
- (void)setCoordinationPathTriggered:(BOOL)a3;
- (void)setCoreUtilsDestinationCount:(unint64_t)a3;
- (void)setCoreUtilsLatency:(unint64_t)a3;
- (void)setNumHomePodsWithDoorbellChimeEnabled:(unint64_t)a3;
@end

@implementation HMDDoorbellChimeNotificationLogEvent

- (void).cxx_destruct
{
}

- (void)setNumHomePodsWithDoorbellChimeEnabled:(unint64_t)a3
{
  self->_numHomePodsWithDoorbellChimeEnabled = a3;
}

- (unint64_t)numHomePodsWithDoorbellChimeEnabled
{
  return self->_numHomePodsWithDoorbellChimeEnabled;
}

- (void)setCoordinationMode:(unint64_t)a3
{
  self->_coordinationMode = a3;
}

- (unint64_t)coordinationMode
{
  return self->_coordinationMode;
}

- (void)setCoordinationError:(id)a3
{
}

- (NSError)coordinationError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCoordinationLatency:(int64_t)a3
{
  self->_coordinationLatency = a3;
}

- (int64_t)coordinationLatency
{
  return self->_coordinationLatency;
}

- (void)setCoordinationPathTriggered:(BOOL)a3
{
  self->_coordinationPathTriggered = a3;
}

- (BOOL)coordinationPathTriggered
{
  return self->_coordinationPathTriggered;
}

- (void)setCoreUtilsDestinationCount:(unint64_t)a3
{
  self->_coreUtilsDestinationCount = a3;
}

- (unint64_t)coreUtilsDestinationCount
{
  return self->_coreUtilsDestinationCount;
}

- (void)setCoreUtilsLatency:(unint64_t)a3
{
  self->_coreUtilsLatency = a3;
}

- (unint64_t)coreUtilsLatency
{
  return self->_coreUtilsLatency;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDDoorbellChimeNotificationLogEvent coordinationLatency](self, "coordinationLatency"));
  [v3 setObject:v4 forKeyedSubscript:@"coordinationLatency"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent coreUtilsLatency](self, "coreUtilsLatency"));
  [v3 setObject:v5 forKeyedSubscript:@"coreUtilsLatency"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent coordinationMode](self, "coordinationMode"));
  [v3 setObject:v6 forKeyedSubscript:@"coordinationMode"];

  v7 = NSNumber;
  v8 = [(HMDDoorbellChimeNotificationLogEvent *)self coordinationError];
  v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "code"));
  [v3 setObject:v9 forKeyedSubscript:@"coordinationErrorCode"];

  v10 = [(HMDDoorbellChimeNotificationLogEvent *)self coordinationError];
  v11 = [v10 domain];
  [v3 setObject:v11 forKeyedSubscript:@"coordinationErrorDomain"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDDoorbellChimeNotificationLogEvent coordinationPathTriggered](self, "coordinationPathTriggered"));
  [v3 setObject:v12 forKeyedSubscript:@"coordinationPathTriggered"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent coreUtilsDestinationCount](self, "coreUtilsDestinationCount"));
  [v3 setObject:v13 forKeyedSubscript:@"coreUtilsDestinationCount"];

  v14 = NSNumber;
  v15 = [(HMMLogEvent *)self error];
  v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
  [v3 setObject:v16 forKeyedSubscript:@"coreUtilErrorCode"];

  v17 = [(HMMLogEvent *)self error];
  v18 = [v17 domain];
  [v3 setObject:v18 forKeyedSubscript:@"coreUtilErrorDomain"];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent numHomePodsWithDoorbellChimeEnabled](self, "numHomePodsWithDoorbellChimeEnabled"));
  [v3 setObject:v19 forKeyedSubscript:@"numHomePodsWithDoorbellChimeEnabled"];

  [v3 setObject:&unk_1F2DC76D8 forKeyedSubscript:@"numEventsFromThisDevice"];
  v20 = (void *)[v3 copy];

  return (NSDictionary *)v20;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.DoorbellChimeController.NotificationLogEvent";
}

@end