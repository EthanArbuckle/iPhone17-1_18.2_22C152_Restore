@interface HMDBulletinNotificationLogEvent
- (HMDBulletinNotificationLogEvent)initWithTopic:(int64_t)a3;
- (NSString)topic;
@end

@implementation HMDBulletinNotificationLogEvent

- (void).cxx_destruct
{
}

- (NSString)topic
{
  return self->_topic;
}

- (HMDBulletinNotificationLogEvent)initWithTopic:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDBulletinNotificationLogEvent;
  v4 = [(HMMLogEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)(a3 - 1) > 0x15) {
      v6 = @"Unknown";
    }
    else {
      v6 = off_264A19668[a3 - 1];
    }
    objc_storeStrong((id *)&v4->_topic, v6);
  }
  return v5;
}

@end