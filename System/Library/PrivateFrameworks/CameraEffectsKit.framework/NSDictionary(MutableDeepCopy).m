@interface NSDictionary(MutableDeepCopy)
- (id)mutableDeepCopy;
@end

@implementation NSDictionary(MutableDeepCopy)

- (id)mutableDeepCopy
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 keyEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = [a1 objectForKey:v5];
      v7 = (void *)[v6 mutableDeepCopy];

      [v2 setObject:v7 forKey:v5];
      uint64_t v8 = [v3 nextObject];

      v5 = (void *)v8;
    }
    while (v8);
  }

  return v2;
}

@end