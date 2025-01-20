@interface AASOSVariant
+ (BOOL)isInternal:(const char *)a3;
@end

@implementation AASOSVariant

+ (BOOL)isInternal:(const char *)a3
{
  return MEMORY[0x1F40CD658](a3, a2);
}

@end