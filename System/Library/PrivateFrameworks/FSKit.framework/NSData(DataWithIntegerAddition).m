@interface NSData(DataWithIntegerAddition)
+ (id)dataWithInteger:()DataWithIntegerAddition;
@end

@implementation NSData(DataWithIntegerAddition)

+ (id)dataWithInteger:()DataWithIntegerAddition
{
  uint64_t v5 = a3;
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5 length:8];
  return v3;
}

@end