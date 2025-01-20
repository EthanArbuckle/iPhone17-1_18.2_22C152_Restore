@interface NSMapTable(HomeKit)
- (id)hm_allKeys;
@end

@implementation NSMapTable(HomeKit)

- (id)hm_allKeys
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v3 = [a1 keyEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      [v2 addObject:v5];
      uint64_t v6 = [v3 nextObject];

      v5 = (void *)v6;
    }
    while (v6);
  }
  v7 = (void *)[v2 copy];

  return v7;
}

@end