@interface NSSet(CPAccNavParam)
- (id)cp_setByRemovingObject:()CPAccNavParam;
@end

@implementation NSSet(CPAccNavParam)

- (id)cp_setByRemovingObject:()CPAccNavParam
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  return v5;
}

@end