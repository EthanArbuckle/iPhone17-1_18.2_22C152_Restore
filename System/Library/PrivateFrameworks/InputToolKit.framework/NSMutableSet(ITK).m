@interface NSMutableSet(ITK)
+ (id)itk_setFromNonNilArray:()ITK;
- (void)itk_addNonNilObject:()ITK;
- (void)itk_addObjectsFromNonNilArray:()ITK;
- (void)itk_removeNonNilObject:()ITK;
- (void)itk_removeObjectsFromNonNilArray:()ITK;
@end

@implementation NSMutableSet(ITK)

+ (id)itk_setFromNonNilArray:()ITK
{
  v4 = (void *)MEMORY[0x263EFFA68];
  if (a3) {
    v4 = a3;
  }
  id v5 = v4;
  v6 = [a1 setWithArray:v5];

  return v6;
}

- (void)itk_addNonNilObject:()ITK
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)itk_removeNonNilObject:()ITK
{
  if (a3) {
    return objc_msgSend(a1, "removeObject:");
  }
  return a1;
}

- (void)itk_addObjectsFromNonNilArray:()ITK
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (void)itk_removeObjectsFromNonNilArray:()ITK
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 removeObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end