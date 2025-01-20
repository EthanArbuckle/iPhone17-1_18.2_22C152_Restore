@interface NSDictionary
@end

@implementation NSDictionary

void __47__NSDictionary_ContactsFoundation___cn_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

uint64_t __45__NSDictionary_ContactsFoundation___cn_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__NSDictionary_ContactsFoundation___cn_keysAndValues__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __44__NSDictionary_ContactsFoundation___cn_map___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v5 = a3;
  id v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v7 = [v6 allKeys];
  v8 = [v7 firstObject];

  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v22 = @"originalKey";
    v23[0] = v17;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v15 = @"nil key during transform";
    goto LABEL_10;
  }
  v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v20 = @"originalKey";
    id v21 = v17;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v15 = @"null key during transform";
    goto LABEL_10;
  }
  v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (v10)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v18[0] = @"originalKey";
    v18[1] = @"transformedKey";
    v19[0] = v17;
    v19[1] = v8;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    v15 = @"duplicated key during transform";
LABEL_10:
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v15, v14, v17);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  v11 = [v6 objectForKeyedSubscript:v8];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v8];
}

void __48__NSDictionary_ContactsFoundation___cn_mapKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v20 = @"originalKey";
    v21[0] = v15;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = @"nil key during transform";
    goto LABEL_10;
  }
  v7 = (void *)v6;
  v8 = [MEMORY[0x1E4F1CA98] null];

  if (v7 == v8)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v18 = @"originalKey";
    id v19 = v15;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v13 = @"null key during transform";
    goto LABEL_10;
  }
  v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v16[0] = @"originalKey";
    v16[1] = @"transformedKey";
    v17[0] = v15;
    v17[1] = v7;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v13 = @"duplicated key during transform";
LABEL_10:
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v13, v12, v15);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
}

void __50__NSDictionary_ContactsFoundation___cn_mapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v9);
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

@end