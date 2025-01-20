@interface HDHRNotificationMetric
+ (NSString)eventName;
- (HDHRNotificationMetric)initWithNotificationType:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4;
- (NSNumber)isDoNotDisturbOn;
- (NSNumber)notificationThreshold;
- (NSString)cardioFitnessNotificationType;
- (NSString)notificationType;
- (id)eventPayload;
- (int64_t)irregularRhythmNotificationsAlgorithmVersion;
- (void)setCardioFitnessNotificationType:(id)a3;
- (void)setDoNotDisturbOn:(id)a3;
- (void)setIrregularRhythmNotificationsAlgorithmVersion:(int64_t)a3;
- (void)setNotificationThreshold:(id)a3;
- (void)submit;
@end

@implementation HDHRNotificationMetric

- (HDHRNotificationMetric)initWithNotificationType:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHRNotificationMetric;
  v7 = [(HDHRNotificationMetric *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    notificationType = v7->_notificationType;
    v7->_notificationType = (NSString *)v8;

    doNotDisturbOn = v7->_doNotDisturbOn;
    v7->_doNotDisturbOn = (NSNumber *)&unk_1F2B42130;

    notificationThreshold = v7->_notificationThreshold;
    v7->_notificationThreshold = (NSNumber *)&unk_1F2B42130;

    cardioFitnessNotificationType = v7->_cardioFitnessNotificationType;
    v7->_cardioFitnessNotificationType = (NSString *)@"-1";

    v7->_irregularRhythmNotificationsAlgorithmVersion = -1;
    v7->_areHealthNotificationsAuthorized = a4;
  }

  return v7;
}

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.heart.notifications";
}

- (id)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_notificationType forKeyedSubscript:@"notificationType"];
  [v3 setObject:self->_doNotDisturbOn forKeyedSubscript:@"isDoNotDisturbOn"];
  [v3 setObject:self->_notificationThreshold forKeyedSubscript:@"notificationThreshold"];
  [v3 setObject:self->_cardioFitnessNotificationType forKeyedSubscript:@"cardioFitnessNotificationType"];
  v4 = [NSNumber numberWithInteger:self->_irregularRhythmNotificationsAlgorithmVersion];
  [v3 setObject:v4 forKeyedSubscript:@"versionIRN"];

  v5 = [NSNumber numberWithBool:self->_areHealthNotificationsAuthorized];
  [v3 setObject:v5 forKeyedSubscript:@"areHealthNotificationsAuthorized"];

  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)submit
{
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    id v4 = [(id)objc_opt_class() eventName];
    id v3 = [(HDHRNotificationMetric *)self eventPayload];
    AnalyticsSendEvent();
  }
}

- (NSString)notificationType
{
  return self->_notificationType;
}

- (NSNumber)isDoNotDisturbOn
{
  return self->_doNotDisturbOn;
}

- (void)setDoNotDisturbOn:(id)a3
{
}

- (NSNumber)notificationThreshold
{
  return self->_notificationThreshold;
}

- (void)setNotificationThreshold:(id)a3
{
}

- (NSString)cardioFitnessNotificationType
{
  return self->_cardioFitnessNotificationType;
}

- (void)setCardioFitnessNotificationType:(id)a3
{
}

- (int64_t)irregularRhythmNotificationsAlgorithmVersion
{
  return self->_irregularRhythmNotificationsAlgorithmVersion;
}

- (void)setIrregularRhythmNotificationsAlgorithmVersion:(int64_t)a3
{
  self->_irregularRhythmNotificationsAlgorithmVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardioFitnessNotificationType, 0);
  objc_storeStrong((id *)&self->_notificationThreshold, 0);
  objc_storeStrong((id *)&self->_doNotDisturbOn, 0);

  objc_storeStrong((id *)&self->_notificationType, 0);
}

@end