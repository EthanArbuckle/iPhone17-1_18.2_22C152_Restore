@interface NSDictionary(IAMSubset)
- (uint64_t)isSubsetOfDictionary:()IAMSubset;
@end

@implementation NSDictionary(IAMSubset)

- (uint64_t)isSubsetOfDictionary:()IAMSubset
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__NSDictionary_IAMSubset__isSubsetOfDictionary___block_invoke;
  v8[3] = &unk_2643466E0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end