@interface NSNumber
- (double)cgFloatValue;
@end

@implementation NSNumber

- (double)cgFloatValue
{
  [(NSNumber *)self doubleValue];
  return result;
}

@end