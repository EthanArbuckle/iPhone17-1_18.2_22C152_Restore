@interface NSObject(CALExtensions)
- (BOOL)isNull;
@end

@implementation NSObject(CALExtensions)

- (BOOL)isNull
{
  v2 = [MEMORY[0x263EFF9D0] null];
  BOOL v3 = v2 == a1;

  return v3;
}

@end