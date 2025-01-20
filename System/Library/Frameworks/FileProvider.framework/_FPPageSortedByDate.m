@interface _FPPageSortedByDate
- (const)bytes;
- (unint64_t)length;
@end

@implementation _FPPageSortedByDate

- (unint64_t)length
{
  return 19;
}

- (const)bytes
{
  return "FPPageSortedByDate";
}

@end