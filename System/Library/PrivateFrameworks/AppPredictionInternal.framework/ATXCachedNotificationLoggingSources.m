@interface ATXCachedNotificationLoggingSources
- (ATXCachedNotificationLoggingSources)init;
- (ATXStableContactRepresentationDatastore)contactRepresentationDatastore;
- (ATXUserNotificationBiomeStream)userNotificationBiomeStream;
- (BMSource)notificationUsageSource;
@end

@implementation ATXCachedNotificationLoggingSources

- (ATXCachedNotificationLoggingSources)init
{
  v15.receiver = self;
  v15.super_class = (Class)ATXCachedNotificationLoggingSources;
  v2 = [(ATXCachedNotificationLoggingSources *)&v15 init];
  if (v2)
  {
    v3 = [ATXStableContactRepresentationDatastore alloc];
    v4 = objc_opt_new();
    uint64_t v5 = [(ATXStableContactRepresentationDatastore *)v3 initWithContactStore:v4];
    contactRepresentationDatastore = v2->_contactRepresentationDatastore;
    v2->_contactRepresentationDatastore = (ATXStableContactRepresentationDatastore *)v5;

    uint64_t v7 = objc_opt_new();
    userNotificationBiomeStream = v2->_userNotificationBiomeStream;
    v2->_userNotificationBiomeStream = (ATXUserNotificationBiomeStream *)v7;

    v9 = BiomeLibrary();
    v10 = [v9 Notification];
    v11 = [v10 Usage];
    uint64_t v12 = [v11 source];
    notificationUsageSource = v2->_notificationUsageSource;
    v2->_notificationUsageSource = (BMSource *)v12;
  }
  return v2;
}

- (ATXUserNotificationBiomeStream)userNotificationBiomeStream
{
  return (ATXUserNotificationBiomeStream *)objc_getProperty(self, a2, 8, 1);
}

- (BMSource)notificationUsageSource
{
  return (BMSource *)objc_getProperty(self, a2, 16, 1);
}

- (ATXStableContactRepresentationDatastore)contactRepresentationDatastore
{
  return (ATXStableContactRepresentationDatastore *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactRepresentationDatastore, 0);
  objc_storeStrong((id *)&self->_notificationUsageSource, 0);
  objc_storeStrong((id *)&self->_userNotificationBiomeStream, 0);
}

@end