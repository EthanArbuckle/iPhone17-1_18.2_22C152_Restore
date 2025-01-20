@interface COAlarmManager(Home)
+ (id)hf_AlarmManagerForAccessory:()Home;
@end

@implementation COAlarmManager(Home)

+ (id)hf_AlarmManagerForAccessory:()Home
{
  id v3 = a3;
  v4 = objc_alloc_init(_HFAlarmConnectionProvider);
  v5 = (void *)[objc_alloc(MEMORY[0x263F33F38]) initForAccessory:v3 withConnectionProvider:v4];

  return v5;
}

@end