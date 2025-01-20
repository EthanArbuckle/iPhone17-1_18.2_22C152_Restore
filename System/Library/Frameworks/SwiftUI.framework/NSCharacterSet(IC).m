@interface NSCharacterSet(IC)
+ (uint64_t)ic_emojiCharacterSet;
@end

@implementation NSCharacterSet(IC)

+ (uint64_t)ic_emojiCharacterSet
{
  return MEMORY[0x1F4113C80]();
}

@end