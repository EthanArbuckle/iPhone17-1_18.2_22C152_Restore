@interface NSMutableString(Padding)
- (uint64_t)rightPaddToLength:()Padding;
@end

@implementation NSMutableString(Padding)

- (uint64_t)rightPaddToLength:()Padding
{
  return objc_msgSend(a1, "appendFormat:", @"%*c", a3 - objc_msgSend(a1, "length"), 32);
}

@end