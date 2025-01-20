@interface UIColor(Alarms)
+ (uint64_t)hu_alarmsBackgroundColor;
+ (uint64_t)hu_alarmsCellAccessoryColor;
+ (uint64_t)hu_alarmsCellHighlightColor;
+ (uint64_t)hu_alarmsDisabledTextColor;
+ (uint64_t)hu_alarmsPrimaryColor;
+ (uint64_t)hu_alarmsPrimaryTextColor;
+ (uint64_t)hu_alarmsSwitchTintColor;
@end

@implementation UIColor(Alarms)

+ (uint64_t)hu_alarmsPrimaryColor
{
  return [MEMORY[0x1E4F428B8] labelColor];
}

+ (uint64_t)hu_alarmsBackgroundColor
{
  return [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
}

+ (uint64_t)hu_alarmsPrimaryTextColor
{
  return [MEMORY[0x1E4F428B8] labelColor];
}

+ (uint64_t)hu_alarmsDisabledTextColor
{
  return [MEMORY[0x1E4F428B8] systemLightGrayColor];
}

+ (uint64_t)hu_alarmsCellHighlightColor
{
  return [MEMORY[0x1E4F428B8] systemOrangeColor];
}

+ (uint64_t)hu_alarmsCellAccessoryColor
{
  return [MEMORY[0x1E4F428B8] systemOrangeColor];
}

+ (uint64_t)hu_alarmsSwitchTintColor
{
  return [MEMORY[0x1E4F428B8] systemYellowColor];
}

@end