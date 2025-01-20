@interface GDOSVariant
+ (BOOL)isInternalDevice;
@end

@implementation GDOSVariant

+ (BOOL)isInternalDevice
{
  return MEMORY[0x1F40CD630]("com.apple.intelligenceplatform", a2);
}

@end