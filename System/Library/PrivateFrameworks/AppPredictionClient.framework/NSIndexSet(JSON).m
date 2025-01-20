@interface NSIndexSet(JSON)
- (id)atx_asArray;
@end

@implementation NSIndexSet(JSON)

- (id)atx_asArray
{
  v2 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__NSIndexSet_JSON__atx_asArray__block_invoke;
  v6[3] = &unk_1E5D05860;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateIndexesUsingBlock:v6];
  v4 = (void *)[v3 copy];

  return v4;
}

@end