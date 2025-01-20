@interface LNValueType(CATSupport)
- (uint64_t)cat_keyPath;
- (void)cat_value:()CATSupport;
@end

@implementation LNValueType(CATSupport)

- (uint64_t)cat_keyPath
{
  return 0;
}

- (void)cat_value:()CATSupport
{
  id v3 = a3;
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[LNValueType valueForCAT:] must be overridden"];
  __break(1u);
}

@end