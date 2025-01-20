@interface APKOSVariant
+ (BOOL)isInternal:(const char *)a3;
@end

@implementation APKOSVariant

+ (BOOL)isInternal:(const char *)a3
{
  return MEMORY[0x270EDAB48](a3, a2);
}

@end