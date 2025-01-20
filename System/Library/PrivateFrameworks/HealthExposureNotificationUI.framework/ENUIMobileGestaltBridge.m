@interface ENUIMobileGestaltBridge
+ (BOOL)wapiCapability;
@end

@implementation ENUIMobileGestaltBridge

+ (BOOL)wapiCapability
{
  return MEMORY[0x270F95FB8](@"wapi", a2);
}

@end