@interface HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric
+ (BOOL)requiresImproveHealthAndActivityAllowed;
- (BOOL)isImproveHealthAndActivityAllowed;
- (HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3;
- (NSNumber)age;
- (NSNumber)biologicalSex;
- (NSString)notificationClassification;
- (NSString)notificationInteractionType;
- (NSString)notificationType;
- (id)eventName;
- (id)eventPayload;
- (void)setAge:(id)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setImproveHealthAndActivityAllowed:(BOOL)a3;
- (void)setNotificationClassification:(id)a3;
- (void)setNotificationInteractionType:(id)a3;
- (void)setNotificationType:(id)a3;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric

- (HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric;
  result = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)&v5 init];
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
  return @"com.apple.health.walkingsteadiness.notification.interaction";
}

- (id)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)self notificationClassification];
  [v3 setObject:v4 forKeyedSubscript:@"notificationClassification"];

  objc_super v5 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)self notificationType];
  [v3 setObject:v5 forKeyedSubscript:@"notificationType"];

  v6 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)self age];
  v7 = +[HKMobilityAnalyticsUtilities payloadValueForAge:v6];
  [v3 setObject:v7 forKeyedSubscript:@"age"];

  v8 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)self biologicalSex];
  v9 = +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:v8];
  [v3 setObject:v9 forKeyedSubscript:@"sex"];

  v10 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)self notificationInteractionType];
  [v3 setObject:v10 forKeyedSubscript:@"notificationInteractionType"];

  v11 = (void *)[v3 copy];

  return v11;
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

- (NSString)notificationInteractionType
{
  return self->_notificationInteractionType;
}

- (void)setNotificationInteractionType:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_notificationInteractionType, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);

  objc_storeStrong((id *)&self->_notificationClassification, 0);
}

@end