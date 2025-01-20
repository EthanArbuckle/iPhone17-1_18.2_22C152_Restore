@interface DARingerSwitchStateReader
+ (int)readCurrentState;
@end

@implementation DARingerSwitchStateReader

+ (int)readCurrentState
{
  return _BKSHIDServicesGetRingerState(a1, a2);
}

@end