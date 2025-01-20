@interface BKThreeLevelForest
- (void)addLeaf:(void *)a3 toBranch:(void *)a4 trunk:;
@end

@implementation BKThreeLevelForest

void __43__BKThreeLevelForest_enumerateTrunk_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v7];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
  [v6 unionSet:v5];
}

void __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke_2;
  v4[3] = &unk_1E6871268;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)addLeaf:(void *)a3 toBranch:(void *)a4 trunk:
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = *(void **)(a1 + 8);
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v11 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v10;

      uint64_t v9 = *(void **)(a1 + 8);
    }
    id v12 = [v9 objectForKey:v8];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 8) setObject:v12 forKey:v8];
    }
    objc_msgSend(v12, "bs_addObject:toCollectionClass:forKey:", v13, objc_opt_class(), v7);
  }
}

- (void).cxx_destruct
{
}

@end