@interface NSScanner(NSUIntegerParsing)
- (uint64_t)scanUnsignedInteger:()NSUIntegerParsing;
@end

@implementation NSScanner(NSUIntegerParsing)

- (uint64_t)scanUnsignedInteger:()NSUIntegerParsing
{
  uint64_t v5 = 0;
  uint64_t result = [a1 scanUnsignedLongLong:&v5];
  if (result) {
    *a3 = v5;
  }
  return result;
}

@end