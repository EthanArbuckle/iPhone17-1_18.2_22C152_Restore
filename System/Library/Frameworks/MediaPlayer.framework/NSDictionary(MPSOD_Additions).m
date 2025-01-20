@interface NSDictionary(MPSOD_Additions)
- (id)mp_deepMerge:()MPSOD_Additions;
@end

@implementation NSDictionary(MPSOD_Additions)

- (id)mp_deepMerge:()MPSOD_Additions
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NSDictionary_MPSOD_Additions__mp_deepMerge___block_invoke;
  v8[3] = &unk_1E57F5410;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

@end