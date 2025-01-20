@interface NSMutableArray(FMAdditions)
- (void)fm_safeAddObject:()FMAdditions;
@end

@implementation NSMutableArray(FMAdditions)

- (void)fm_safeAddObject:()FMAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end