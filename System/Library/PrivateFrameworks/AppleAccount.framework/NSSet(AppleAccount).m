@interface NSSet(AppleAccount)
- (id)aa_setByRemovingObject:()AppleAccount;
- (id)aa_setByRemovingObjectsFromSet:()AppleAccount;
@end

@implementation NSSet(AppleAccount)

- (id)aa_setByRemovingObject:()AppleAccount
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  v6 = (void *)[v5 copy];

  return v6;
}

- (id)aa_setByRemovingObjectsFromSet:()AppleAccount
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 minusSet:v4];

  v6 = (void *)[v5 copy];

  return v6;
}

@end