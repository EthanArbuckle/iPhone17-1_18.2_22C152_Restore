@interface HMDEventRouterSendRemoteEventLogEvent
- (BOOL)isCachedEvent;
- (HMDEventRouterSendRemoteEventLogEvent)initWithTopic:(id)a3 sourceDeviceType:(unint64_t)a4 destinationDeviceType:(unint64_t)a5 isCachedEvent:(BOOL)a6 responseMessageType:(unint64_t)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)topic;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)destinationDeviceType;
- (unint64_t)responseMessageType;
- (unint64_t)sourceDeviceType;
@end

@implementation HMDEventRouterSendRemoteEventLogEvent

- (void).cxx_destruct
{
}

- (unint64_t)responseMessageType
{
  return self->_responseMessageType;
}

- (BOOL)isCachedEvent
{
  return self->_isCachedEvent;
}

- (unint64_t)destinationDeviceType
{
  return self->_destinationDeviceType;
}

- (unint64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDEventRouterSendRemoteEventLogEvent)initWithTopic:(id)a3 sourceDeviceType:(unint64_t)a4 destinationDeviceType:(unint64_t)a5 isCachedEvent:(BOOL)a6 responseMessageType:(unint64_t)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDEventRouterSendRemoteEventLogEvent;
  v13 = [(HMMLogEvent *)&v17 init];
  if (v13)
  {
    uint64_t v14 = +[HMDEventRouterLogEventUtilities sanitizedTopicFromTopic:v12];
    topic = v13->_topic;
    v13->_topic = (NSString *)v14;

    v13->_sourceDeviceType = a4;
    v13->_destinationDeviceType = a5;
    v13->_isCachedEvent = a6;
    v13->_responseMessageType = a7;
  }

  return v13;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"eventTopic";
  v3 = [(HMDEventRouterSendRemoteEventLogEvent *)self topic];
  v11[0] = v3;
  v10[1] = @"sourceDeviceType";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDEventRouterSendRemoteEventLogEvent sourceDeviceType](self, "sourceDeviceType"));
  v11[1] = v4;
  v10[2] = @"destinationDeviceType";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDEventRouterSendRemoteEventLogEvent destinationDeviceType](self, "destinationDeviceType"));
  v11[2] = v5;
  v10[3] = @"isCachedEvent";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventRouterSendRemoteEventLogEvent isCachedEvent](self, "isCachedEvent"));
  v11[3] = v6;
  v10[4] = @"responseMessageType";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDEventRouterSendRemoteEventLogEvent responseMessageType](self, "responseMessageType"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.eventrouter.topic.remote.event.send";
}

@end