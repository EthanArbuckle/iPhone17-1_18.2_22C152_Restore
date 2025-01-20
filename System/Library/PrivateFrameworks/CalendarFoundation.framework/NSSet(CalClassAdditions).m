@interface NSSet(CalClassAdditions)
+ (id)intersectionOfSet:()CalClassAdditions withSet:;
- (id)allObjectsWithClass:()CalClassAdditions;
- (void)CalMutableRecursiveCopy;
@end

@implementation NSSet(CalClassAdditions)

- (void)CalMutableRecursiveCopy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [v8 CalMutableRecursiveCopy];
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0 {
               && objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0DA0E0, (void)v12))
        }
        {
          uint64_t v9 = [v8 mutableCopy];
        }
        else
        {
          uint64_t v9 = objc_msgSend(v8, "copy", (void)v12);
        }
        v10 = (void *)v9;
        objc_msgSend(v2, "addObject:", v9, (void)v12);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)allObjectsWithClass:()CalClassAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v10);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)intersectionOfSet:()CalClassAdditions withSet:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  uint64_t v7 = [v5 setWithSet:a3];
  [v7 intersectSet:v6];

  return v7;
}

@end