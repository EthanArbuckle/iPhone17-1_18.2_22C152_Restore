@interface UNNotificationRequest(HKMobility)
+ (id)_hkmobility_notificationRequestWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:;
+ (id)hkmobility_requestForCategory:()HKMobility shouldHidePregnancyContent:;
+ (uint64_t)_hkmobility_requestForCategory:()HKMobility shouldHidePregnancyContent:startDate:;
@end

@implementation UNNotificationRequest(HKMobility)

+ (id)hkmobility_requestForCategory:()HKMobility shouldHidePregnancyContent:
{
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  v8 = [v6 now];
  v9 = objc_msgSend(a1, "_hkmobility_requestForCategory:shouldHidePregnancyContent:startDate:", v7, a4, v8);

  return v9;
}

+ (uint64_t)_hkmobility_requestForCategory:()HKMobility shouldHidePregnancyContent:startDate:
{
  return objc_msgSend(a1, "_hkmobility_notificationRequestWithCategory:shouldHidePregnancyContent:expirationDate:", a3, a4, 0);
}

+ (id)_hkmobility_notificationRequestWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:
{
  v0 = objc_msgSend(MEMORY[0x1E4F445B0], "_hkmobility_contentWithCategory:shouldHidePregnancyContent:expirationDate:");
  v1 = [v0 categoryIdentifier];
  v2 = HKMobilityNotificationIdentifierForCategory(v1);

  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  v5 = [v2 stringByAppendingString:v4];

  v6 = [MEMORY[0x1E4F44628] requestWithIdentifier:v5 content:v0 trigger:0];

  return v6;
}

@end