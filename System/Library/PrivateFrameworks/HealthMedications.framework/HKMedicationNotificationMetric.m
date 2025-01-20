@interface HKMedicationNotificationMetric
+ (NSString)eventName;
- (HKMedicationNotificationMetric)initWithType:(int64_t)a3 areHealthNotificationsAuthorized:(id)a4 dataSource:(id)a5;
- (NSDictionary)eventPayload;
- (NSNumber)areHealthNotificationsAuthorized;
- (id)description;
- (id)interactionTypeValue;
- (id)typeValue;
- (int64_t)interactionType;
- (int64_t)type;
- (void)setEventPayload:(id)a3;
- (void)setInteractionType:(int64_t)a3;
@end

@implementation HKMedicationNotificationMetric

- (HKMedicationNotificationMetric)initWithType:(int64_t)a3 areHealthNotificationsAuthorized:(id)a4 dataSource:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationNotificationMetric;
  v11 = [(HKMedicationNotificationMetric *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_areHealthNotificationsAuthorized, a4);
    v12->_interactionType = 0;
    v13 = [[HKMedicationAnalyticsGenericFieldsProvider alloc] initWithDataSource:v10];
    genericDataProvider = v12->_genericDataProvider;
    v12->_genericDataProvider = v13;
  }
  return v12;
}

+ (NSString)eventName
{
  return (NSString *)@"com.apple.HealthRecords.MedsReminderNotifications";
}

- (id)typeValue
{
  if (self->_type == 1) {
    return @"NotificationSent";
  }
  else {
    return @"NotificationInteractedWith";
  }
}

- (id)interactionTypeValue
{
  unint64_t interactionType = self->_interactionType;
  if (interactionType < 7) {
    return (id)qword_1E62EBBE8[interactionType];
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKMedicationNotificationMetric.m", 63, @"Unexpected Interaction Type %ld", self->_interactionType);

  return 0;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(HKMedicationNotificationMetric *)self typeValue];
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  v5 = [(HKMedicationNotificationMetric *)self areHealthNotificationsAuthorized];

  if (v5)
  {
    v6 = [(HKMedicationNotificationMetric *)self areHealthNotificationsAuthorized];
    [v3 setObject:v6 forKeyedSubscript:@"areHealthNotificationsAuthorized"];
  }
  v7 = [(HKMedicationAnalyticsGenericFieldsProvider *)self->_genericDataProvider biologicalSex];
  v8 = [(HKMedicationAnalyticsGenericFieldsProvider *)self->_genericDataProvider activePairedWatchProductType];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"biologicalSex"];
  }
  genericDataProvider = self->_genericDataProvider;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [(HKMedicationAnalyticsGenericFieldsProvider *)genericDataProvider bucketedUserAgeForCurrentDate:v10];
  [v3 setObject:v11 forKeyedSubscript:@"age"];

  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:@"activePairedWatchProductType"];
  }
  v12 = [(HKMedicationNotificationMetric *)self interactionTypeValue];

  if (v12)
  {
    v13 = [(HKMedicationNotificationMetric *)self interactionTypeValue];
    [v3 setObject:v13 forKeyedSubscript:@"action"];
  }
  v14 = (void *)[v3 copy];

  return (NSDictionary *)v14;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKMedicationNotificationMetric *)self eventPayload];
  v6 = [v3 stringWithFormat:@"%@:%p payload: %@", v4, self, v5];

  return v6;
}

- (void)setEventPayload:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(int64_t)a3
{
  self->_unint64_t interactionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_genericDataProvider, 0);

  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
}

@end