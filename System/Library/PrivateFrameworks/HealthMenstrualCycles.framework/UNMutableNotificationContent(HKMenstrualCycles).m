@interface UNMutableNotificationContent(HKMenstrualCycles)
+ (id)_hkmc_contentWithCategory:()HKMenstrualCycles body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:;
@end

@implementation UNMutableNotificationContent(HKMenstrualCycles)

+ (id)_hkmc_contentWithCategory:()HKMenstrualCycles body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(a1);
  [v16 setBody:v14];

  [v16 setCategoryIdentifier:v15];
  [v16 setExpirationDate:v13];

  [v16 setThreadIdentifier:@"com.apple.health.MenstrualCycles"];
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v17 setObject:&unk_26D7D0190 forKeyedSubscript:*MEMORY[0x263F0ADA8]];
  if (a7)
  {
    v18 = [NSNumber numberWithInteger:a7];
    [v17 setObject:v18 forKeyedSubscript:HKMCNotificationAssociatedDayIndexKey];
  }
  [v16 setUserInfo:v17];
  if (v12) {
    [v16 setTitle:v12];
  }

  return v16;
}

@end