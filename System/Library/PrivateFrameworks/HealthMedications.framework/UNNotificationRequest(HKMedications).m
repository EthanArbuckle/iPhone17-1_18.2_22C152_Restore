@interface UNNotificationRequest(HKMedications)
+ (id)hkmd_requestForNotification:()HKMedications;
+ (id)hkmd_requestForTimeZoneNotification;
+ (uint64_t)isNotMissedCategory:()HKMedications;
@end

@implementation UNNotificationRequest(HKMedications)

+ (id)hkmd_requestForNotification:()HKMedications
{
  id v4 = a3;
  v5 = +[UNNotificationRequest _requestIDForNotification:](a1, v4);
  v6 = +[UNNotificationRequest _contentForNotification:](a1, v4);

  v7 = [MEMORY[0x1E4F44628] requestWithIdentifier:v5 content:v6 trigger:0];

  return v7;
}

+ (id)hkmd_requestForTimeZoneNotification
{
  v0 = +[UNNotificationRequest _timeZoneContent]();
  v1 = [MEMORY[0x1E4F44628] requestWithIdentifier:@"MedicationTimeZoneNotificationIdentifier" content:v0 trigger:0];

  return v1;
}

+ (uint64_t)isNotMissedCategory:()HKMedications
{
  id v3 = a3;
  if (([v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissed"] & 1) != 0
    || ([v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissedFollowUp"] & 1) != 0
    || ([v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissed.Singular"] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissedFollowUp.Singular"];
  }

  return v4;
}

@end