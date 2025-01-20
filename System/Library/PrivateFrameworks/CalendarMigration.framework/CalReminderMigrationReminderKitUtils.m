@interface CalReminderMigrationReminderKitUtils
+ (id)hexColorStringByRemovingAlphaFromHexString:(id)a3;
@end

@implementation CalReminderMigrationReminderKitUtils

+ (id)hexColorStringByRemovingAlphaFromHexString:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 9)
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 7);

    id v3 = (id)v4;
  }
  v5 = [v3 uppercaseString];

  return v5;
}

@end