@interface HDSharedDataPrivacyNotification
+ (id)category;
- (HDSharedDataPrivacyNotification)initWithNotificationManager:(id)a3 guardianFirstName:(id)a4 lastName:(id)a5;
- (id)body;
- (id)title;
@end

@implementation HDSharedDataPrivacyNotification

- (HDSharedDataPrivacyNotification)initWithNotificationManager:(id)a3 guardianFirstName:(id)a4 lastName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDSharedDataPrivacyNotification;
  v11 = [(HDNanoHealthNotification *)&v14 initWithNotificationManager:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstName, a4);
    objc_storeStrong((id *)&v12->_lastName, a5);
  }

  return v12;
}

+ (id)category
{
  return @"HDSharedDataPrivacyNotificationCategory";
}

- (id)title
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"SHARED_HEALTH_DATA_NOTIFICATION_TITLE" value:&stru_1F1728D60 table:@"Localizable-tinker"];

  return v3;
}

- (id)body
{
  firstName = self->_firstName;
  v3 = (objc_class *)MEMORY[0x1E4F28F30];
  v4 = self->_lastName;
  v5 = firstName;
  id v6 = objc_alloc_init(v3);
  [v6 setGivenName:v5];

  [v6 setFamilyName:v4];
  v7 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v6 style:2 options:0];

  v8 = NSString;
  id v9 = HKHealthKitFrameworkBundle();
  id v10 = [v9 localizedStringForKey:@"SHARED_HEALTH_DATA_NOTIFICATION_BODY_%@" value:&stru_1F1728D60 table:@"Localizable-tinker"];
  v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end