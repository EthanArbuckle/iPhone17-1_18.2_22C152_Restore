@interface HKUnit(HealthRecordsUI)
+ (id)safeUnitFromString:()HealthRecordsUI;
@end

@implementation HKUnit(HealthRecordsUI)

+ (id)safeUnitFromString:()HealthRecordsUI
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [MEMORY[0x1E4F2B618] unitFromString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end