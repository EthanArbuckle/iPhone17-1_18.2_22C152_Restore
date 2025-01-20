@interface HDSharedDataOptInNotification
+ (id)category;
- (HDSharedDataOptInNotification)initWithNotificationManager:(id)a3 guardianDisplayName:(id)a4;
- (id)body;
- (id)title;
- (unint64_t)destinations;
@end

@implementation HDSharedDataOptInNotification

- (HDSharedDataOptInNotification)initWithNotificationManager:(id)a3 guardianDisplayName:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDSharedDataOptInNotification;
  v7 = [(HDNanoHealthNotification *)&v11 initWithNotificationManager:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    guardianDisplayName = v7->_guardianDisplayName;
    v7->_guardianDisplayName = (NSString *)v8;
  }
  return v7;
}

+ (id)category
{
  return @"HDSharedDataOptInNotificationCategory";
}

- (unint64_t)destinations
{
  return 19;
}

- (id)title
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"START_SHARING_DATA_NOTIFICATION_TITLE" value:&stru_1F1728D60 table:@"Localizable-tinker"];

  return v3;
}

- (id)body
{
  v3 = NSString;
  v4 = HKHealthKitFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"START_SHARING_DATA_NOTIFICATION_BODY_%@" value:&stru_1F1728D60 table:@"Localizable-tinker"];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, self->_guardianDisplayName);

  return v6;
}

- (void).cxx_destruct
{
}

@end