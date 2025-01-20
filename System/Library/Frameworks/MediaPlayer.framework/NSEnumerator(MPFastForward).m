@interface NSEnumerator(MPFastForward)
- (id)nextObjectIdenticalTo:()MPFastForward;
@end

@implementation NSEnumerator(MPFastForward)

- (id)nextObjectIdenticalTo:()MPFastForward
{
  id v4 = a3;
  id v5 = 0;
  do
  {
    v6 = v5;
    id v5 = [a1 nextObject];
  }
  while (v5 && v5 != v4);

  return v5;
}

@end