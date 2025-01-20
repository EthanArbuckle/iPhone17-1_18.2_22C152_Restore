@interface CALNUNNotificationSoundMapper
+ (id)calnNotificationSoundFromUNNotificationSound:(id)a3;
+ (id)unNotificationSoundFromCALNNotificationSound:(id)a3;
@end

@implementation CALNUNNotificationSoundMapper

+ (id)unNotificationSoundFromCALNNotificationSound:(id)a3
{
  v3 = (void *)MEMORY[0x263F1DF68];
  id v4 = a3;
  v5 = objc_msgSend(v3, "soundWithAlertType:", objc_msgSend(v4, "alertType"));
  v6 = (void *)[v5 mutableCopy];

  v7 = [v4 alertTopic];

  [v6 setAlertTopic:v7];
  v8 = (void *)[v6 copy];

  return v8;
}

+ (id)calnNotificationSoundFromUNNotificationSound:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 alertType];
  v5 = [v3 alertTopic];

  v6 = +[CALNNotificationSound soundWithAlertType:v4 alertTopic:v5];

  return v6;
}

@end