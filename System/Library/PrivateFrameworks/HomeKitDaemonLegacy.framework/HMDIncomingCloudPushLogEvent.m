@interface HMDIncomingCloudPushLogEvent
+ (id)incomingCloudPush:(id)a3;
- (HMDIncomingCloudPushLogEvent)initWithTopic:(id)a3;
- (NSString)topic;
@end

@implementation HMDIncomingCloudPushLogEvent

- (void).cxx_destruct
{
}

- (NSString)topic
{
  return self->_topic;
}

- (HMDIncomingCloudPushLogEvent)initWithTopic:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDIncomingCloudPushLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topic, a3);
  }

  return v7;
}

+ (id)incomingCloudPush:(id)a3
{
  id v3 = a3;
  v4 = [[HMDIncomingCloudPushLogEvent alloc] initWithTopic:v3];

  return v4;
}

@end