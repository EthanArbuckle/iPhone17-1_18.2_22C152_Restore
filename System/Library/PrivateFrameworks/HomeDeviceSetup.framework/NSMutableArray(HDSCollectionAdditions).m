@interface NSMutableArray(HDSCollectionAdditions)
- (void)hds_addNonNilObject:()HDSCollectionAdditions;
@end

@implementation NSMutableArray(HDSCollectionAdditions)

- (void)hds_addNonNilObject:()HDSCollectionAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end