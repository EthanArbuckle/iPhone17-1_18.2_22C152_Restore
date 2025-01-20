@interface NSDateFormatter(FamilyCircle)
+ (id)fa_checklistDateFormatter;
+ (id)fa_standardFormatter;
@end

@implementation NSDateFormatter(FamilyCircle)

+ (id)fa_standardFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v0 setLocale:v1];

  [v0 setTimeStyle:0];
  [v0 setDateStyle:1];
  [v0 setDoesRelativeDateFormatting:1];
  return v0;
}

+ (id)fa_checklistDateFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v0 setLocale:v1];

  [v0 setLocalizedDateFormatFromTemplate:@"MMMM d, yyyy"];
  return v0;
}

@end