@interface DSUsageLogLine
- (BOOL)isOffPower;
- (BOOL)isOnPower;
- (BOOL)isReset;
- (int)batteryLevel;
- (int)standbyTime;
- (int)usageTime;
@end

@implementation DSUsageLogLine

- (int)usageTime
{
  return [(DSLogLine *)self integerFromFieldAtIndex:2];
}

- (int)standbyTime
{
  return [(DSLogLine *)self integerFromFieldAtIndex:3];
}

- (int)batteryLevel
{
  return [(DSLogLine *)self integerFromFieldAtIndex:4];
}

- (BOOL)isReset
{
  v2 = [(DSUsageLogLine *)self eventType];
  char v3 = [v2 isEqualToString:@"1"];

  return v3;
}

- (BOOL)isOnPower
{
  v2 = [(DSUsageLogLine *)self eventType];
  char v3 = [v2 isEqualToString:@"2"];

  return v3;
}

- (BOOL)isOffPower
{
  v2 = [(DSUsageLogLine *)self eventType];
  char v3 = [v2 isEqualToString:@"3"];

  return v3;
}

@end