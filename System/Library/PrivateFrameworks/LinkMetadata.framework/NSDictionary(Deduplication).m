@interface NSDictionary(Deduplication)
- (id)ln_deduping:()Deduplication;
@end

@implementation NSDictionary(Deduplication)

- (id)ln_deduping:()Deduplication
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NSDictionary_Deduplication__ln_deduping___block_invoke;
  v11[3] = &unk_1E590D730;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

@end