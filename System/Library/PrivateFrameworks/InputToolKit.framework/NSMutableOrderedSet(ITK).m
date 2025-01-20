@interface NSMutableOrderedSet(ITK)
- (void)itk_addNonNilObject:()ITK;
@end

@implementation NSMutableOrderedSet(ITK)

- (void)itk_addNonNilObject:()ITK
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end