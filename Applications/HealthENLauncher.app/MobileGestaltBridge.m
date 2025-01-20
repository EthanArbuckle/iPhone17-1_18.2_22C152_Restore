@interface MobileGestaltBridge
+ (BOOL)wapiCapability;
@end

@implementation MobileGestaltBridge

+ (BOOL)wapiCapability
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

@end