@interface NSMutableDictionary(AXHAUltronController)
- (void)setSafeObject:()AXHAUltronController forKey:;
@end

@implementation NSMutableDictionary(AXHAUltronController)

- (void)setSafeObject:()AXHAUltronController forKey:
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (uint64_t)v8;
    if (!v8)
    {
      uint64_t v7 = [MEMORY[0x263EFF9D0] null];
    }
    id v8 = (id)v7;
    [a1 setObject:v7 forKey:v6];
  }
}

@end