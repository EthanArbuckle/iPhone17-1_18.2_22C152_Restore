@interface NSMutableArray(AXExtras)
- (void)ax_removeObjectsFromArrayUsingBlock:()AXExtras;
@end

@implementation NSMutableArray(AXExtras)

- (void)ax_removeObjectsFromArrayUsingBlock:()AXExtras
{
  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 removeObjectsAtIndexes:v2];
}

@end