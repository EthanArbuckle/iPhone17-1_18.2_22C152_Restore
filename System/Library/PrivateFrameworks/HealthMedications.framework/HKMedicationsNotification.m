@interface HKMedicationsNotification
+ (id)allNotificationCategories;
+ (id)notificationBeforeFirstUnlockWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4;
+ (id)notificationCategoryForString:(id)a3;
+ (id)notificationMissedWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4;
+ (id)notificationNotMissedWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4 isBatchingDoses:(BOOL)a5 isCritical:(BOOL)a6 isFollowUp:(BOOL)a7;
- (HKMedicationsNotification)init;
- (NSDate)dueDate;
- (NSDictionary)userInfo;
- (NSString)argument;
- (NSString)category;
- (NSString)scheduleItemIdentifier;
- (id)_userInfoWithScheduleItemIdentifier:(void *)a3 extraUserInfo:;
- (id)initWithScheduleItemIdentifier:(void *)a3 dueDate:(void *)a4 category:(void *)a5 argument:(void *)a6 extraUserInfo:;
@end

@implementation HKMedicationsNotification

- (HKMedicationsNotification)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)notificationBeforeFirstUnlockWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[HKMedicationsNotification initWithScheduleItemIdentifier:dueDate:category:argument:extraUserInfo:]((id *)[HKMedicationsNotification alloc], v6, v5, @"MedicationsHealthAppPlugin.BeforeFirstUnlock", 0, 0);

  return v7;
}

- (id)initWithScheduleItemIdentifier:(void *)a3 dueDate:(void *)a4 category:(void *)a5 argument:(void *)a6 extraUserInfo:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)HKMedicationsNotification;
    v17 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 1, a4);
      objc_storeStrong(a1 + 2, a5);
      uint64_t v18 = -[HKMedicationsNotification _userInfoWithScheduleItemIdentifier:extraUserInfo:](a1, v12, v16);
      id v19 = a1[3];
      a1[3] = (id)v18;

      objc_storeStrong(a1 + 4, a2);
      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

+ (id)notificationMissedWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[HKMedicationsNotification initWithScheduleItemIdentifier:dueDate:category:argument:extraUserInfo:]((id *)[HKMedicationsNotification alloc], v6, v5, @"MedicationsHealthAppPlugin.Missed", 0, 0);

  return v7;
}

+ (id)notificationNotMissedWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4 isBatchingDoses:(BOOL)a5 isCritical:(BOOL)a6 isFollowUp:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v25[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = @"MedicationsHealthAppPlugin.NotMissed";
  if (v7) {
    id v13 = @"MedicationsHealthAppPlugin.NotMissedFollowUp";
  }
  id v14 = v13;
  id v15 = v14;
  if (!v9)
  {
    int v16 = [(__CFString *)v14 isEqualToString:@"MedicationsHealthAppPlugin.NotMissed"];

    if (v16) {
      id v15 = @"MedicationsHealthAppPlugin.NotMissed.Singular";
    }
    else {
      id v15 = @"MedicationsHealthAppPlugin.NotMissedFollowUp.Singular";
    }
  }
  v17 = [HKMedicationsNotification alloc];
  v24[0] = @"MedicationsNotificationIsCriticalKey";
  uint64_t v18 = [NSNumber numberWithBool:v8];
  v25[0] = v18;
  v24[1] = @"MedicationsNotificationIsFollowUpKey";
  id v19 = [NSNumber numberWithBool:v7];
  v25[1] = v19;
  v24[2] = @"MedicationsNotificationIsBatchNotificationKey";
  v20 = [NSNumber numberWithBool:v9];
  v25[2] = v20;
  objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v22 = -[HKMedicationsNotification initWithScheduleItemIdentifier:dueDate:category:argument:extraUserInfo:]((id *)&v17->super.isa, v11, v12, v15, 0, v21);

  return v22;
}

- (id)_userInfoWithScheduleItemIdentifier:(void *)a3 extraUserInfo:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA60];
    id v7 = a2;
    BOOL v8 = [v6 dictionary];
    [v8 setObject:v7 forKeyedSubscript:@"MedicationsNotificationScheduleItemIdentifierKey"];

    if (v5) {
      [v8 addEntriesFromDictionary:v5];
    }
    a1 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8];
  }

  return a1;
}

+ (id)allNotificationCategories
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"MedicationsHealthAppPlugin.BeforeFirstUnlock";
  v4[1] = @"MedicationsHealthAppPlugin.NotMissed";
  v4[2] = @"MedicationsHealthAppPlugin.NotMissed.Singular";
  v4[3] = @"MedicationsHealthAppPlugin.NotMissedFollowUp";
  v4[4] = @"MedicationsHealthAppPlugin.NotMissedFollowUp.Singular";
  v4[5] = @"MedicationsHealthAppPlugin.Missed";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];

  return v2;
}

+ (id)notificationCategoryForString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = @"MedicationsHealthAppPlugin.BeforeFirstUnlock";
  if (([v3 isEqualToString:@"MedicationsHealthAppPlugin.BeforeFirstUnlock"] & 1) == 0)
  {
    uint64_t v4 = @"MedicationsHealthAppPlugin.NotMissed";
    if (([v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissed"] & 1) == 0)
    {
      uint64_t v4 = @"MedicationsHealthAppPlugin.NotMissedFollowUp";
      if (([v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissedFollowUp"] & 1) == 0)
      {
        uint64_t v4 = @"MedicationsHealthAppPlugin.Missed";
        if (([v3 isEqualToString:@"MedicationsHealthAppPlugin.Missed"] & 1) == 0)
        {
          uint64_t v4 = @"MedicationsHealthAppPlugin.NotMissed.Singular";
          if (([v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissed.Singular"] & 1) == 0)
          {
            uint64_t v4 = @"MedicationsHealthAppPlugin.NotMissedFollowUp.Singular";
            if (![v3 isEqualToString:@"MedicationsHealthAppPlugin.NotMissedFollowUp.Singular"])uint64_t v4 = 0; {
          }
            }
        }
      }
    }
  }

  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)argument
{
  return self->_argument;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_argument, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end