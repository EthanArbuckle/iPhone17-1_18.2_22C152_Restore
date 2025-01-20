@interface NSMutableArray(MSArrayUtilities)
- (void)MSRemoveOneObject:()MSArrayUtilities;
- (void)MSRemoveOneObjectByPointerComparison:()MSArrayUtilities;
@end

@implementation NSMutableArray(MSArrayUtilities)

- (void)MSRemoveOneObjectByPointerComparison:()MSArrayUtilities
{
  id v6 = a3;
  if ([a1 count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [a1 objectAtIndex:v4];

      if (v5 == v6) {
        break;
      }
      if (++v4 >= (unint64_t)[a1 count]) {
        goto LABEL_7;
      }
    }
    [a1 removeObjectAtIndex:v4];
  }
LABEL_7:
}

- (void)MSRemoveOneObject:()MSArrayUtilities
{
  id v7 = a3;
  if ([a1 count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [a1 objectAtIndex:v4];
      int v6 = [v5 isEqual:v7];

      if (v6) {
        break;
      }
      if (++v4 >= (unint64_t)[a1 count]) {
        goto LABEL_7;
      }
    }
    [a1 removeObjectAtIndex:v4];
  }
LABEL_7:
}

@end