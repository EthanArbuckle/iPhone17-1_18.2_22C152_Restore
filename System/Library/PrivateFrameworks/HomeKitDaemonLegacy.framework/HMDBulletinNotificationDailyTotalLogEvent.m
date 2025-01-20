@interface HMDBulletinNotificationDailyTotalLogEvent
- (HMDBulletinNotificationDailyTotalLogEvent)initWithTopic:(id)a3 countForTopic:(unint64_t)a4 userNotificationSettings:(id)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)topic;
- (unint64_t)bulletinNotificationSettings;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)topicCount;
@end

@implementation HMDBulletinNotificationDailyTotalLogEvent

- (void).cxx_destruct
{
}

- (unint64_t)bulletinNotificationSettings
{
  return self->_bulletinNotificationSettings;
}

- (unint64_t)topicCount
{
  return self->_topicCount;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"topic";
  v3 = [(HMDBulletinNotificationDailyTotalLogEvent *)self topic];
  v9[0] = v3;
  v8[1] = @"topicCount";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDBulletinNotificationDailyTotalLogEvent topicCount](self, "topicCount"));
  v9[1] = v4;
  v8[2] = @"bulletinNotificationSettings";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDBulletinNotificationDailyTotalLogEvent bulletinNotificationSettings](self, "bulletinNotificationSettings"));
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.daemon.bulletinNotificationDailyTotal";
}

- (HMDBulletinNotificationDailyTotalLogEvent)initWithTopic:(id)a3 countForTopic:(unint64_t)a4 userNotificationSettings:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDBulletinNotificationDailyTotalLogEvent;
  v11 = [(HMMLogEvent *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_topic, a3);
    v12->_topicCount = a4;
    id v13 = v10;
    uint64_t v14 = [v13 authorizationStatus];
    uint64_t v15 = [v13 lockScreenSetting];
    uint64_t v16 = [v13 notificationCenterSetting];
    uint64_t v17 = [v13 criticalAlertSetting];
    uint64_t v18 = [v13 timeSensitiveSetting];

    BOOL v19 = v16 == 2 || v15 == 2;
    uint64_t v20 = 3;
    if (!v19) {
      uint64_t v20 = 1;
    }
    if (v17 == 2) {
      v20 |= 4uLL;
    }
    if (v18 == 2) {
      v20 |= 8uLL;
    }
    if (v14 != 2) {
      uint64_t v20 = 0;
    }
    v12->_bulletinNotificationSettings = v20;
  }

  return v12;
}

@end