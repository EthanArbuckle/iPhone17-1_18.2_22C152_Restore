@interface NSMapTable(CATAdditions)
- (BOOL)cat_containsKey:()CATAdditions;
@end

@implementation NSMapTable(CATAdditions)

- (BOOL)cat_containsKey:()CATAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  BOOL v2 = v1 != 0;

  return v2;
}

@end