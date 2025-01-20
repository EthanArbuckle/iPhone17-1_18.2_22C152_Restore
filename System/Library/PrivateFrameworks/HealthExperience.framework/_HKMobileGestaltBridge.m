@interface _HKMobileGestaltBridge
+ (BOOL)wapiCapability;
@end

@implementation _HKMobileGestaltBridge

+ (BOOL)wapiCapability
{
  return MEMORY[0x1F417CE00](@"wapi", a2);
}

@end