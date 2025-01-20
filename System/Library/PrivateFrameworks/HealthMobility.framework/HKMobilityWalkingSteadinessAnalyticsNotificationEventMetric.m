@interface HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric
+ (BOOL)requiresImproveHealthAndActivityAllowed;
- (BOOL)isImproveHealthAndActivityAllowed;
- (HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3;
- (NSNumber)age;
- (NSNumber)areHealthNotificationsAuthorized;
- (NSNumber)biologicalSex;
- (NSNumber)daysSinceLastNotification;
- (NSString)notificationClassification;
- (NSString)notificationType;
- (id)eventName;
- (id)eventPayload;
- (void)setAge:(id)a3;
- (void)setAreHealthNotificationsAuthorized:(id)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setDaysSinceLastNotification:(id)a3;
- (void)setImproveHealthAndActivityAllowed:(BOOL)a3;
- (void)setNotificationClassification:(id)a3;
- (void)setNotificationType:(id)a3;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric

- (HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric;
  result = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)&v5 init];
  if (result) {
    result->_improveHealthAndActivityAllowed = a3;
  }
  return result;
}

+ (BOOL)requiresImproveHealthAndActivityAllowed
{
  return 1;
}

- (id)eventName
{
  return @"com.apple.health.walkingsteadiness.notifications";
}

- (id)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)self notificationClassification];
  [v3 setObject:v4 forKeyedSubscript:@"notificationClassification"];

  objc_super v5 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)self notificationType];
  [v3 setObject:v5 forKeyedSubscript:@"notificationType"];

  v6 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)self age];
  v7 = +[HKMobilityAnalyticsUtilities payloadValueForAge:v6];
  [v3 setObject:v7 forKeyedSubscript:@"age"];

  v8 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)self biologicalSex];
  v9 = +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:v8];
  [v3 setObject:v9 forKeyedSubscript:@"sex"];

  v10 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)self daysSinceLastNotification];
  [v3 setObject:v10 forKeyedSubscript:@"daysSinceLastNotification"];

  v11 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)self areHealthNotificationsAuthorized];
  [v3 setObject:v11 forKeyedSubscript:@"areHealthNotificationsAuthorized"];

  v12 = (void *)[v3 copy];

  return v12;
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return self->_improveHealthAndActivityAllowed;
}

- (void)setImproveHealthAndActivityAllowed:(BOOL)a3
{
  self->_improveHealthAndActivityAllowed = a3;
}

- (NSString)notificationClassification
{
  return self->_notificationClassification;
}

- (void)setNotificationClassification:(id)a3
{
}

- (NSString)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(id)a3
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
}

- (NSNumber)daysSinceLastNotification
{
  return self->_daysSinceLastNotification;
}

- (void)setDaysSinceLastNotification:(id)a3
{
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_daysSinceLastNotification, 0);
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);

  objc_storeStrong((id *)&self->_notificationClassification, 0);
}

@end