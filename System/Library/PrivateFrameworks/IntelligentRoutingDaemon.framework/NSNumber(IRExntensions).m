@interface NSNumber(IRExntensions)
- (BOOL)isGreaterThan:()IRExntensions;
- (BOOL)isGreaterThanOrEqualTo:()IRExntensions;
- (BOOL)isLessThan:()IRExntensions;
- (BOOL)isLessThanOrEqualTo:()IRExntensions;
@end

@implementation NSNumber(IRExntensions)

- (BOOL)isGreaterThanOrEqualTo:()IRExntensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)isLessThanOrEqualTo:()IRExntensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)isGreaterThan:()IRExntensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isLessThan:()IRExntensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

@end