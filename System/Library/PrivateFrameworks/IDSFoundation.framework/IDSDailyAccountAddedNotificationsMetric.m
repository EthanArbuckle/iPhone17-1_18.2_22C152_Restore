@interface IDSDailyAccountAddedNotificationsMetric
- (IDSDailyAccountAddedNotificationsMetric)initWithNotificationsPostedToday:(id)a3 duplicateNotificationPostedToday:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)dailyDuplicateNotificationsPosted;
- (NSNumber)dailyNotificationsPosted;
- (NSString)name;
@end

@implementation IDSDailyAccountAddedNotificationsMetric

- (NSString)name
{
  return (NSString *)@"IDSDailyAccountNotificationPosted";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  dailyNotificationsPosted = self->_dailyNotificationsPosted;
  if (dailyNotificationsPosted) {
    CFDictionarySetValue(v3, @"daily_notifications_posted", dailyNotificationsPosted);
  }
  dailyDuplicateNotificationsPosted = self->_dailyDuplicateNotificationsPosted;
  if (dailyDuplicateNotificationsPosted) {
    CFDictionarySetValue(v4, @"daily_duplicate_notifications_posted", dailyDuplicateNotificationsPosted);
  }
  return (NSDictionary *)v4;
}

- (IDSDailyAccountAddedNotificationsMetric)initWithNotificationsPostedToday:(id)a3 duplicateNotificationPostedToday:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSDailyAccountAddedNotificationsMetric;
  v9 = [(IDSDailyAccountAddedNotificationsMetric *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dailyNotificationsPosted, a3);
    objc_storeStrong((id *)&v10->_dailyDuplicateNotificationsPosted, a4);
  }

  return v10;
}

- (NSNumber)dailyNotificationsPosted
{
  return self->_dailyNotificationsPosted;
}

- (NSNumber)dailyDuplicateNotificationsPosted
{
  return self->_dailyDuplicateNotificationsPosted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyDuplicateNotificationsPosted, 0);
  objc_storeStrong((id *)&self->_dailyNotificationsPosted, 0);
}

@end