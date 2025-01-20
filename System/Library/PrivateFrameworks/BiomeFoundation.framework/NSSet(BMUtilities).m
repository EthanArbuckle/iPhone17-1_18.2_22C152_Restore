@interface NSSet(BMUtilities)
- (id)bm_setBySubtractingSet:()BMUtilities;
@end

@implementation NSSet(BMUtilities)

- (id)bm_setBySubtractingSet:()BMUtilities
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 minusSet:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

@end