@interface NSDate(HeartHealth)
+ (id)hkhr_ISO8601StringForDate:()HeartHealth;
+ (id)hkhr_dateWithISO8601String:()HeartHealth;
@end

@implementation NSDate(HeartHealth)

+ (id)hkhr_dateWithISO8601String:()HeartHealth
{
  v3 = (objc_class *)MEMORY[0x1E4F28D48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v5 dateFromString:v4];

  return v6;
}

+ (id)hkhr_ISO8601StringForDate:()HeartHealth
{
  v3 = (objc_class *)MEMORY[0x1E4F28D48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v5 stringFromDate:v4];

  return v6;
}

@end