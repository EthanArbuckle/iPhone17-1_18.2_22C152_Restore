@interface NSMutableArray(CALExtensions)
+ (CFMutableArrayRef)nonRetainingArray;
- (void)removeAllObjectsWithClass:()CALExtensions;
@end

@implementation NSMutableArray(CALExtensions)

- (void)removeAllObjectsWithClass:()CALExtensions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [v3 removeObjectsInArray:v2];
}

+ (CFMutableArrayRef)nonRetainingArray
{
  long long v0 = *(_OWORD *)(MEMORY[0x263EFFF70] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x263EFFF70];
  *(_OWORD *)&v3.release = v0;
  v3.equal = *(CFArrayEqualCallBack *)(MEMORY[0x263EFFF70] + 32);
  v3.retain = 0;
  v3.release = 0;
  CFMutableArrayRef v1 = CFArrayCreateMutable(0, 0, &v3);
  return v1;
}

@end