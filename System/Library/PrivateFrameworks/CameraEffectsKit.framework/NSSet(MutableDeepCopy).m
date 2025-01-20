@interface NSSet(MutableDeepCopy)
- (id)mutableDeepCopy;
@end

@implementation NSSet(MutableDeepCopy)

- (id)mutableDeepCopy
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v3 = [a1 objectEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (void *)[v5 mutableDeepCopy];

      [v2 addObject:v6];
      v5 = [v3 nextObject];
    }
    while (v5);
  }

  return v2;
}

@end