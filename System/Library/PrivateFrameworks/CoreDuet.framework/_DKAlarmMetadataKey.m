@interface _DKAlarmMetadataKey
+ (id)alarmID;
+ (id)isSleep;
@end

@implementation _DKAlarmMetadataKey

+ (id)alarmID
{
  return @"_DKAlarmMetadataKey-alarmID";
}

+ (id)isSleep
{
  return @"_DKAlarmMetadataKey-isSleep";
}

@end