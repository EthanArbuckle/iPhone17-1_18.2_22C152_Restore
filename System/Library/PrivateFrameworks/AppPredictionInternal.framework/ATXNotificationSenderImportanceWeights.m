@interface ATXNotificationSenderImportanceWeights
- (ATXNotificationSenderImportanceWeights)init;
- (double)frequencyOfInteractionWithNotification;
- (double)interactedWithNotificationToday;
- (double)speedOfResponseToNotification;
@end

@implementation ATXNotificationSenderImportanceWeights

- (ATXNotificationSenderImportanceWeights)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXNotificationSenderImportanceWeights;
  v2 = [(ATXNotificationSenderImportanceWeights *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXNotificationSenderImportance" ofType:@"plist" specifiedABGroup:0];
    notificationSenderImportanceWeights = v2->_notificationSenderImportanceWeights;
    v2->_notificationSenderImportanceWeights = (NSDictionary *)v3;
  }
  return v2;
}

- (double)interactedWithNotificationToday
{
  v2 = [(NSDictionary *)self->_notificationSenderImportanceWeights objectForKeyedSubscript:@"interactedWithToday"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

- (double)speedOfResponseToNotification
{
  v2 = [(NSDictionary *)self->_notificationSenderImportanceWeights objectForKeyedSubscript:@"speedOfResponse"];
  uint64_t v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 0.5;
  }

  return v4;
}

- (double)frequencyOfInteractionWithNotification
{
  v2 = [(NSDictionary *)self->_notificationSenderImportanceWeights objectForKeyedSubscript:@"frequencyOfInteraction"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.25;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end