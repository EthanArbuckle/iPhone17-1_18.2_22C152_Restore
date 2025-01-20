@interface NSMutableDictionary(VSAdditions)
- (uint64_t)vs_setObjectUnlessNil:()VSAdditions forKey:;
@end

@implementation NSMutableDictionary(VSAdditions)

- (uint64_t)vs_setObjectUnlessNil:()VSAdditions forKey:
{
  id v6 = a3;
  if (v6) {
    [a1 setObject:v6 forKey:a4];
  }

  return MEMORY[0x1F41817F8]();
}

@end