@interface NSValue(NSValueCMVideoDimensionsExtensions)
+ (uint64_t)valueWithCMVideoDimensions:()NSValueCMVideoDimensionsExtensions;
- (uint64_t)CMVideoDimensionsValue;
@end

@implementation NSValue(NSValueCMVideoDimensionsExtensions)

+ (uint64_t)valueWithCMVideoDimensions:()NSValueCMVideoDimensionsExtensions
{
  uint64_t v4 = a3;
  return [MEMORY[0x1E4F29238] valueWithBytes:&v4 objCType:"{?=ii}"];
}

- (uint64_t)CMVideoDimensionsValue
{
  uint64_t v2 = 0;
  [a1 getValue:&v2];
  return v2;
}

@end