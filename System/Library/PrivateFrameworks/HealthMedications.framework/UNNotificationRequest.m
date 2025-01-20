@interface UNNotificationRequest
+ (id)_bodyForCategory:(uint64_t)a3 argument:(void *)a4 identifier:;
+ (id)_contentByAddingCommonUserInfoTo:(uint64_t)a1;
+ (id)_contentForNotification:(uint64_t)a1;
+ (id)_requestIDForNotification:(uint64_t)a1;
+ (id)_timeZoneContent;
+ (id)_timeZoneUserInfo;
@end

@implementation UNNotificationRequest

+ (id)_requestIDForNotification:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 scheduleItemIdentifier];
  v4 = [v2 dueDate];
  BOOL v5 = +[HKMedicationScheduleItem isScheduleItemIdentifier:v3 matchingDateTime:v4];

  v6 = [v2 scheduleItemIdentifier];
  if (!v5)
  {
    v7 = [v2 dueDate];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v9 = objc_msgSend(v6, "stringByAppendingFormat:", @"-%f", v8);

    v6 = (void *)v9;
  }

  return v6;
}

+ (id)_contentForNotification:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  BOOL v5 = [v2 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"MedicationsNotificationIsFollowUpKey"];
  int v7 = [v6 BOOLValue];

  if (v7) {
    uint64_t v8 = @"MEDICATIONS_NOTIFICATION_TITLE_NOT_MISSED_FOLLOW_UP";
  }
  else {
    uint64_t v8 = @"MEDICATIONS_NOTIFICATION_TITLE_NOT_MISSED";
  }
  uint64_t v9 = [NSString localizedUserNotificationStringForKey:v8 arguments:0];
  [v4 setTitle:v9];

  v10 = [v2 category];
  v11 = [v2 argument];
  uint64_t v12 = [v2 scheduleItemIdentifier];
  v14 = +[UNNotificationRequest _bodyForCategory:argument:identifier:](v3, v10, v13, (void *)v12);
  [v4 setBody:v14];

  v15 = [v2 userInfo];
  v16 = [v15 objectForKeyedSubscript:@"MedicationsNotificationIsCriticalKey"];
  LOBYTE(v12) = [v16 BOOLValue];

  v17 = [v2 category];
  [v4 setCategoryIdentifier:v17];

  v18 = [v2 scheduleItemIdentifier];
  [v4 setThreadIdentifier:v18];

  if (v12)
  {
    v19 = [MEMORY[0x1E4F44640] defaultCriticalSound];
    uint64_t v20 = 3;
  }
  else
  {
    v19 = [MEMORY[0x1E4F44640] soundWithAlertType:25];
    uint64_t v20 = 2;
  }
  [v4 setSound:v19];

  v21 = [v2 userInfo];
  [v4 setUserInfo:v21];

  [v4 setInterruptionLevel:v20];
  v22 = +[UNNotificationRequest _contentByAddingCommonUserInfoTo:](v3, v4);

  return v22;
}

+ (id)_timeZoneContent
{
  self;
  id v0 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  v1 = [NSString localizedUserNotificationStringForKey:@"MEDICATIONS_NOTIFICATION_TIMEZONE_TITLE" arguments:0];
  [v0 setTitle:v1];

  id v2 = [NSString localizedUserNotificationStringForKey:@"MEDICATIONS_NOTIFICATION_TIMEZONE_BODY" arguments:0];
  [v0 setBody:v2];

  uint64_t v3 = +[UNNotificationRequest _timeZoneUserInfo]();
  [v0 setUserInfo:v3];

  [v0 setCategoryIdentifier:@"MedicationsHealthAppPlugin.TimeZone"];
  id v4 = [MEMORY[0x1E4F44640] soundWithAlertType:25];
  [v0 setSound:v4];

  [v0 setInterruptionLevel:2];

  return v0;
}

+ (id)_bodyForCategory:(uint64_t)a3 argument:(void *)a4 identifier:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  self;
  if ([v5 isEqualToString:@"MedicationsHealthAppPlugin.BeforeFirstUnlock"])
  {
    int v7 = NSString;
    uint64_t v8 = @"MEDICATIONS_NOTIFICATION_BODY_BEFORE_FIRST_UNLOCK";
LABEL_7:
    v15 = [v7 localizedUserNotificationStringForKey:v8 arguments:0];
    goto LABEL_8;
  }
  if ([MEMORY[0x1E4F44628] isNotMissedCategory:v5])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v10 dateStyle:0 timeStyle:1];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C10], "hm_localizableTimeStringKeyWithPrefix:date:", @"MEDICATIONS_NOTIFICATION_BODY_NOT_MISSED", v10);
    uint64_t v13 = NSString;
    v17[0] = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v15 = [v13 localizedUserNotificationStringForKey:v12 arguments:v14];

    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"MedicationsHealthAppPlugin.Missed"])
  {
    int v7 = NSString;
    uint64_t v8 = @"MEDICATIONS_NOTIFICATION_BODY_MISSED";
    goto LABEL_7;
  }
  v15 = 0;
LABEL_8:

  return v15;
}

+ (id)_contentByAddingCommonUserInfoTo:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = (void *)[v2 mutableCopy];
  id v4 = [v2 userInfo];

  id v5 = (void *)[v4 mutableCopy];
  [v5 setObject:&unk_1F1718FE0 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];
  id v6 = (void *)[v5 copy];
  [v3 setUserInfo:v6];

  int v7 = (void *)[v3 copy];

  return v7;
}

+ (id)_timeZoneUserInfo
{
  self;
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  [v0 setObject:@"x-apple-health://MedicationsHealthAppPlugin.healthplugin" forKeyedSubscript:*MEMORY[0x1E4F2BF00]];
  [v0 setObject:&unk_1F1718FE0 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v0];

  return v1;
}

@end