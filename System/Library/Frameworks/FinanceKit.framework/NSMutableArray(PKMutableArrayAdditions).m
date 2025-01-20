@interface NSMutableArray(PKMutableArrayAdditions)
- (void)safelyAddObject:()PKMutableArrayAdditions;
@end

@implementation NSMutableArray(PKMutableArrayAdditions)

- (void)safelyAddObject:()PKMutableArrayAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end