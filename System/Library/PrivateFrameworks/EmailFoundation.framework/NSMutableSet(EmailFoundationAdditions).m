@interface NSMutableSet(EmailFoundationAdditions)
- (id)ef_uniquedObject:()EmailFoundationAdditions;
- (void)ef_addOptionalObject:()EmailFoundationAdditions;
- (void)ef_removeObjectsInArray:()EmailFoundationAdditions;
@end

@implementation NSMutableSet(EmailFoundationAdditions)

- (void)ef_addOptionalObject:()EmailFoundationAdditions
{
  id v4 = a3;
  if (v4) {
    [a1 addObject:v4];
  }
}

- (id)ef_uniquedObject:()EmailFoundationAdditions
{
  id v4 = a3;
  v5 = [a1 member:v4];
  if (!v5)
  {
    v5 = (void *)[v4 copyWithZone:0];
    [a1 addObject:v5];
  }

  return v5;
}

- (void)ef_removeObjectsInArray:()EmailFoundationAdditions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "removeObject:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end