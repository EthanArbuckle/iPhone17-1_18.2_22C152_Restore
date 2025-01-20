@interface MergeLocalizedKeysForLocale
@end

@implementation MergeLocalizedKeysForLocale

void ___MergeLocalizedKeysForLocale_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    objc_opt_class();
    id v9 = v6;
    id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
      v12 = v11;
      if (v11)
      {
        v13 = (void *)[v11 mutableCopy];
        [v13 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
        v14 = (void *)[v13 copy];
        [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v7];
      }
      else
      {
        uint64_t v16 = *(void *)(a1 + 40);
        v17[0] = v9;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:v7];
      }
    }
  }
}

@end